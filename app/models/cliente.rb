class Cliente < ApplicationRecord
  validates :nome, presence: true
end
