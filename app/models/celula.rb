class Celula < ApplicationRecord
  belongs_to :centro
  has_and_belongs_to_many :maquinas
end
