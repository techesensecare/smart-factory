class Cliente < ApplicationRecord
  validates :nome, presence: true

  has_many :pedidos

  scope :with_query, -> (q) { where("nome ilike '%' || ? || '%'", q) }
end
