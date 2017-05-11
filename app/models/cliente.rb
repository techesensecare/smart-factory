class Cliente < ApplicationRecord
  validates :nome, presence: true

  has_many :pedidos
end
