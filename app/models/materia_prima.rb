class MateriaPrima < ApplicationRecord
  belongs_to :produto
  belongs_to :produto_usado, class_name: 'Produto'

  #validates :produto_id, :produto_usado_id, :quantidade, presence: true
  validates  :produto_usado_id, :quantidade, presence: true
end
