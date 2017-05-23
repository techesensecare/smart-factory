class Centro < ApplicationRecord
  scope :with_query, -> (q) { where("descricao ilike '%' || ? || '%'", q) }
end
