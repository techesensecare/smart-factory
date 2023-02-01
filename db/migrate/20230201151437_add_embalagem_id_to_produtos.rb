class AddEmbalagemIdToProdutos < ActiveRecord::Migration[5.1]
  def change
    add_column :produtos, :embalagem_id, :integer
  end
end
