class Fornecedor < ApplicationRecord
  validates :nome, presence: true
  has_many :enderecos, as: :enderecable
  accepts_nested_attributes_for :enderecos
end
