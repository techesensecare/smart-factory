class Maquina < ApplicationRecord
  has_many :etapas
  has_and_belongs_to_many :celulas
  validates :descricao, presence: true
end
