class Operacao < ApplicationRecord
  belongs_to :pedido_item
  belongs_to :produto
  belongs_to :maquina
  has_and_belongs_to_many :ferramentas

  validates :ordem, :descricao, :maquina_id, presence: true

  attr_accessor :quantidade_materia_prima
end
