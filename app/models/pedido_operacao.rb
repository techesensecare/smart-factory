class PedidoOperacao < ApplicationRecord
  extend Enumerize

  default_scope { joins(:pedido).order('prioridade DESC, prazo ASC') }

  enumerize :status, in: %w(aguardando na_fila executando pausada finalizada), default: :aguardando, scope: true

  # TODO Remover
  belongs_to :produto

  belongs_to :pedido
  belongs_to :maquina
  belongs_to :pedido_item, class_name: 'ItemPedido'
  has_and_belongs_to_many :ferramentas

  has_many :historicos, class_name: 'PedidoOperacaoHistorico'

  has_many :rejeitos, dependent: :destroy, class_name: "PedidoOperacaoRejeito"
  accepts_nested_attributes_for :rejeitos, allow_destroy: true

  has_many :cronometros

  after_save :update_cronometro


  attr_accessor :nova_maquina_id
  attr_accessor :nova_quantidade

  # Alerta de saldos baixo.
  def alertas
    if @alertas
      @alertas
    else
      @alertas = []
      pedido_item.produto.materia_primas.each do |m|
        if not(m.produto_usado.composto)
          quantidade_necessaria = m.quantidade * quantidade
          if quantidade_necessaria > m.produto_usado.saldo
            alertas << [ m.produto_usado, quantidade_necessaria, m.produto_usado.saldo]
          end
        end
      end
      @alertas
    end
  end

  def finalizar(params, usuario, maquina)
    PedidoOperacao.transaction do
      self.update_attributes params

      # Garante o número quando estiver em branco.
      self.quantidade_produzida ||= 0

      if quantidade_produzida < quantidade
        quantidade_rejeitada = rejeitos.map(&:quantidade).sum

        if quantidade_rejeitada + quantidade_produzida < quantidade
          self.errors.add(:quantidade_produzida, 'valor menor que esperado, atualize ou registre um rejeito')
          raise ActiveRecord::RecordInvalid
        end

        quantidade_restante = quantidade - quantidade_produzida

        # Cria a nova operação.
        outro = self.dup
        outro.quantidade = quantidade_restante
        outro.maquina_id = nil
        outro.status = :aguardando
        descricao_rejeito = rejeitos.map { |r| "#{r.quantidade} #{r.rejeito.descricao} #{r.observacao}" }.join(', ')
        outro.motivo_desmembramento = "Rejeito: #{descricao_rejeito}"
        outro.save
      end

      pedido_item.produto.materia_primas.each do |m|
        if m.produto_usado.tipo.comprado?
          m.produto_usado.movimentos.create(
            :tipo       => :remover, 
            :quantidade => m.quantidade * quantidade_produzida,
            :observacao => "Utilizado na produção de #{m.produto.descricao} no pedido #{pedido.numero}"
          )
        end
      end

      self.save!
      update_status('finalizada', usuario, maquina)
    end
  end

  def update_status(status, usuario, maquina, motivo=nil)
    PedidoOperacao.transaction do
      self.update status: status

      if self.status.executando?
        maquina.update_status :executando, usuario, self
      elsif self.status.pausada? or self.status.finalizada?

        # Guarda o motivo da pausa, para exibir no desmembramento.
        if self.status.pausada? 
          self.update motivo_ultima_pausa: motivo
        end

        if maquina.status.executando?
          maquina.update_status :disponivel, usuario, self
        end
      end

      historicos.create(status: status, usuario: usuario, maquina: maquina, motivo: motivo)

      atualizar_status_pedido
    end
  end
  

  def update_cronometro
    if changes[:status]
      antes, depois = changes[:status]

      # Opções: aguardando na_fila executando pausada finalizada

      if antes == 'na_fila' and depois == :executando 
        self.cronometros.create!(
          tipo:    :executando,
          maquina: self.maquina,
          inicio:  DateTime.current  
        )
      end

      if antes == 'pausada' and depois == :executando 
        self.cronometros.where(tipo:  :pausada, fim: nil).update(fim: DateTime.current)
        self.cronometros.create!(
          tipo:    :executando,
          maquina: self.maquina,
          inicio:  DateTime.current  
        )
      end

      if antes == 'executando' and depois == :pausada
        self.cronometros.where(tipo:  :executando, fim: nil).update(fim: DateTime.current)
        self.cronometros.create!(
          tipo:    :pausada,
          maquina: self.maquina,
          motivo:  self.motivo_ultima_pausa,
          inicio:  DateTime.current  
        )
      end

      if antes == 'executando' and depois == :finalizada
        self.cronometros.where(tipo:  :executando, fim: nil).update(fim: DateTime.current)
      end

    end
  end

  def atualizar_status_pedido
    if pedido.operacoes.where("pedido_operacoes.status <> ?", 'finalizada').blank?
      pedido.update status: :finalizado
    end
  end

  def pode_desmembrar?
    (quantidade > 1 and %w(na_fila pausada).include? status)
  end

  def desmembrar
    outro = self.dup
    outro.quantidade            = nova_quantidade
    outro.motivo_ultima_pausa   = nil
    outro.maquina_id            = nil
    outro.status                = :aguardando
    outro.motivo_desmembramento = "Desmembramento: #{self.motivo_ultima_pausa || 'antes de iniciar a produção'}"
    outro.save

    self.quantidade = quantidade - nova_quantidade.to_i
    self.save
  end

  def descricao_prioridade
    if prioridade == 0
      'baixa'
    elsif prioridade == 1
      'média'
    elsif prioridade == 2
      'alta'
    end
  end
end
