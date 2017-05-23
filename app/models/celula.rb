class Celula < ApplicationRecord
  belongs_to :centro
  has_and_belongs_to_many :maquinas
  scope :with_query, -> (q) { where("descricao ilike '%' || ? || '%'", q) }
end
