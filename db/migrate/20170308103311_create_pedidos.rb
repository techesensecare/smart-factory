class CreatePedidos < ActiveRecord::Migration[5.0]
  def change
    create_table :pedidos do |t|
      t.references :cliente, foreign_key: true
      t.string :numero
      t.text :observacao

      t.timestamps
    end
  end
end
