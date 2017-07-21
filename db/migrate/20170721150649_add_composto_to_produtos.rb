class AddCompostoToProdutos < ActiveRecord::Migration[5.0]
  def change
    add_column :produtos, :composto, :boolean
  end
end
