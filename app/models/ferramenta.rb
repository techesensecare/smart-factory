class Ferramenta < ApplicationRecord
  include Codigo

  extend Enumerize

  validates :descricao, presence: true

  default_scope { order('descricao ASC') }

  scope :with_query, -> (q) { where("descricao ilike '%' || ? || '%'", q) }
end
