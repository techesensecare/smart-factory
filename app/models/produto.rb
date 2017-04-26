class Produto < ApplicationRecord
  extend Enumerize

  enumerize :tipo, in: [:fabricado, :comprado], default: :comprado
  enumerize :unidade_medida, in: [:unidade, :kg, :l, :m2], default: :unidade

  validates :tipo, :descricao, :codigo, :tipo, :unidade_medida,  presence: true

  has_many :anexos, as: :anexavel
  accepts_nested_attributes_for :anexos, :allow_destroy => true

end
