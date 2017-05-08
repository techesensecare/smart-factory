class CreateOperacoes < ActiveRecord::Migration[5.0]
  def change
    create_table :operacoes do |t|
      t.references :produto, foreign_key: true
      t.integer :ordem
      t.string :descricao
      t.references :maquina, foreign_key: true
      t.text :observacao
      t.integer :tempo_setup
      t.integer :tempo_operacao

      t.timestamps
    end
  end
end
