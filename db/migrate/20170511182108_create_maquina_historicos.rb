class CreateMaquinaHistoricos < ActiveRecord::Migration[5.0]
  def change
    create_table :maquina_historicos do |t|
      t.references :maquina, foreign_key: true
      t.references :usuario, foreign_key: true
      t.string :status
      t.references :pedido_operacao, foreign_key: true

      t.timestamps
    end
  end
end
