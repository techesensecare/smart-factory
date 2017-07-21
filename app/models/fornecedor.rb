class Fornecedor < ApplicationRecord
  include Codigo
  include Enderecos

  validates :nome, presence: true

  has_many :contatos, dependent: :destroy

  default_scope { order('nome ASC') }

  scope :with_query, -> (q) { where("nome ilike '%' || ? || '%'", q) }
end
