class Terminal < ApplicationRecord
  validates :descricao, presence: true

  has_and_belongs_to_many :maquinas

  scope :with_query, -> (q) { where("descricao ilike '%' || ? || '%'", q) }
end
