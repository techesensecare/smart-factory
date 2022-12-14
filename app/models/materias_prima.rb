class MateriasPrima < ApplicationRecord
  belongs_to :produto
  belongs_to :sub_produto
end