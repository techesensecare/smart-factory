class MateriaPrima < ApplicationRecord
  belongs_to :produto
  belongs_to :produto_usado, class_name: 'Produto'

  def a 
  end
end
