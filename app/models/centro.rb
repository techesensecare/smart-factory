class Centro < ApplicationRecord
  include Codigo

  validates :descricao, presence: true, uniqueness: true

  scope :with_query, -> (q) { where("descricao ilike '%' || ? || '%'", q) }
end
