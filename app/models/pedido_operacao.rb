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

  attr_accessor :nova_maquina_id
  attr_accessor :nova_quantidade

  def finalizar(params, usuario, maquina)
    PedidoOperacao.transaction do
      self.update_attributes params

      if quantidade_produzida < quantidade
        quantidade_rejeitada = rejeitos.map(&:quantidade).sum

        if quantidade_rejeitada + quantidade_produzida < quantidade
          self.errors.add(:quantidade_produzida, 'valor menor que esperado, atualize ou registre um rejeito')
          raise ActiveRecord::RecordInvalid
        end
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
        if maquina.status.executando?
          maquina.update_status :disponivel, usuario, self
        end
      end

      historicos.create(status: status, usuario: usuario, maquina: maquina, motivo: motivo)

      atualizar_status_pedido
    end
  end

  def atualizar_status_pedido
    if pedido.operacoes.where("pedido_operacoes.status <> ?", 'finalizado').blank?
      pedido.update status: :finalizado
    end
  end

  def pode_desmembrar?
    (quantidade > 1 and %w(na_fila pausada).include? status)
  end

  def desmembrar
    outro = self.dup
    outro.quantidade = nova_quantidade
    outro.maquina_id = nil
    outro.status = :aguardando
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
