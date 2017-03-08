class Maquina < ApplicationRecord
  has_many :etapas
  validates :descricao, presence: true
end
