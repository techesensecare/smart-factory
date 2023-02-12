class ChangeUnidadeToString < ActiveRecord::Migration[5.1]
  def change
    change_column :items_producaos, :unidade, :string
  end
end
