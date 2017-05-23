class Fornecedor < ApplicationRecord
  validates :nome, presence: true
  has_many :enderecos, as: :enderecable
  accepts_nested_attributes_for :enderecos

  default_scope { order('nome ASC') }

  scope :with_query, -> (q) { where("nome ilike '%' || ? || '%'", q) }
end
