class AddColumnMrTasteMpToProdutos < ActiveRecord::Migration[5.1]
  def change
    add_column :produtos, :mr_taste_mp, :integer
  end
end
