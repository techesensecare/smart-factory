class ItemPedido < ApplicationRecord
  belongs_to :pedido
  belongs_to :produto

  before_save :set_produto

  scope :com_produto, -> { where("produto_id is not null") }

  def set_produto
    self.produto = Produto.find_by_descricao(descricao_produto)
  end
end
