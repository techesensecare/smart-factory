class Turno < ApplicationRecord
  scope :with_query, -> (q) { where("descricao ilike '%' || ? || '%'", q) }
  scope :por_descricao, -> { order('descricao ASC') }
end
