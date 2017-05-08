class Ferramenta < ApplicationRecord
  extend Enumerize

  enumerize :tipo, in: %w(tipo1 tipo2), default: :tipo1, scope: true

  validates :descricao, :codigo, presence: true
end
