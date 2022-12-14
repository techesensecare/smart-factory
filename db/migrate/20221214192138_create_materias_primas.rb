class CreateMateriasPrimas < ActiveRecord::Migration[5.1]
  def change
    create_table :materias_primas do |t|
      t.string :descricao
      t.string :unidade_de_medida
      t.string :tipo
      t.integer :saldo
    end
  end
end
