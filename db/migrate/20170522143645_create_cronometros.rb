class CreateCronometros < ActiveRecord::Migration[5.0]
  def change
    create_table :cronometros do |t|
      t.references :pedido_operacao, foreign_key: true
      t.references :maquina, foreign_key: true
      t.string :tipo
      t.string :motivo
      t.datetime :inicio
      t.datetime :fim

      t.timestamps
    end
  end
end
