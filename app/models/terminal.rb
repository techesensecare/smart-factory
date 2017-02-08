class Terminal < ApplicationRecord
  validates :descricao, presence: true

  has_and_belongs_to_many :maquinas
end
