class CreateItemsProducao < ActiveRecord::Migration[5.1]
  def change
    create_table :items_producaos do |t|
      t.integer :pedido_id
      t.integer :produto_id
      t.integer :pedido_item_id
      t.integer :peso
      t.integer :unidade
      t.string :observacao
    end
  end
end
