class PedidoOperacao < ApplicationRecord
  extend Enumerize

  enumerize :status, in: %w(projeto aguardando executando finalizada), default: :projeto, scope: true

  belongs_to :pedido
  belongs_to :produto
  belongs_to :maquina
  belongs_to :pedido_item, class_name: 'ItemPedido'
  has_and_belongs_to_many :ferramentas
end
