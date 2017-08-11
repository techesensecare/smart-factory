class Ferramenta < ApplicationRecord
  include Codigo

  extend Enumerize

  validates :descricao, presence: true

  default_scope { order('descricao ASC') }

  scope :with_query, -> (q) { where("descricao ilike '%' || ? || '%'", q) }

  has_many :anexos, as: :anexavel
  accepts_nested_attributes_for :anexos, :allow_destroy => true
end
