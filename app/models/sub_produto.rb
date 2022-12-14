class SubProduto < ApplicationRecord
  has_many :componentes
  has_many :materias_primas
end