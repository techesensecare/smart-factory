class CreateFerramentas < ActiveRecord::Migration[5.0]
  def change
    create_table :ferramentas do |t|
      t.string :descricao
      t.string :codigo
      t.string :unidade_medida
      t.string :tipo
      t.integer :quantidade
      t.text :observacao

      t.timestamps
    end
  end
end
