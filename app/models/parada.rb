class Parada < ApplicationRecord
  default_scope { order('descricao ASC') }
  scope :with_query, -> (q) { where("descricao ilike '%' || ? || '%'", q) }
end
