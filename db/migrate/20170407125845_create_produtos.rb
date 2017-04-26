class CreateProdutos < ActiveRecord::Migration[5.0]
  def change
    create_table :produtos do |t|
      t.string :codigo
      t.string :descricao
      t.string :unidade_medida
      t.string :tipo

      t.timestamps
    end
  end
end
