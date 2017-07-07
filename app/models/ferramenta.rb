class Ferramenta < ApplicationRecord
  include Codigo

  extend Enumerize

  enumerize :tipo, in: %w(tipo1 tipo2), default: :tipo1, scope: true

  validates :descricao, presence: true

  default_scope { order('descricao ASC') }

  scope :with_query, -> (q) { where("descricao ilike '%' || ? || '%'", q) }
end
