class Fornecedor < ApplicationRecord
  include Codigo
  include Enderecos

  validates :nome, presence: true

  default_scope { order('nome ASC') }

  scope :with_query, -> (q) { where("nome ilike '%' || ? || '%'", q) }
end
