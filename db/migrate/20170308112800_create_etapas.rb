class CreateEtapas < ActiveRecord::Migration[5.0]
  def change
    create_table :etapas do |t|
      t.integer :pedido_id
      t.integer :etapa_id
      t.integer :maquina_id
      t.string :descricao
      t.integer :quantidade
      t.datetime :data_entrega
      t.integer :dependencia

      t.timestamps
    end
  end
end
