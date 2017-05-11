class PedidoOperacao < ApplicationRecord
  extend Enumerize

  enumerize :status, in: %w(aguardando na_fila executando pausada finalizada), default: :aguardando, scope: true

  belongs_to :pedido
  belongs_to :produto
  belongs_to :maquina
  belongs_to :pedido_item, class_name: 'ItemPedido'
  has_and_belongs_to_many :ferramentas

  has_many :historicos, class_name: 'PedidoOperacaoHistorico'

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
    end
  end
end
