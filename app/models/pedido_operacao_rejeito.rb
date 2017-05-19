class PedidoOperacaoRejeito < ApplicationRecord
  belongs_to :pedido_operacao
  belongs_to :rejeito

  validates :quantidade, :rejeito_id, presence: true
end
