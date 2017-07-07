class Rejeito < ApplicationRecord
  include Codigo

  scope :with_query, -> (q) { where("descricao ilike '%' || ? || '%'", q) }
end
