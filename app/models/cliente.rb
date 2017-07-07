class Cliente < ApplicationRecord
  include Codigo
  include Enderecos

  validates :nome, presence: true

  has_many :pedidos
  has_many :contatos, dependent: :destroy

  scope :with_query, -> (q) { where("nome ilike '%' || ? || '%'", q) }
end
