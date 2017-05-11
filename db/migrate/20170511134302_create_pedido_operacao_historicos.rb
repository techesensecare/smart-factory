class CreatePedidoOperacaoHistoricos < ActiveRecord::Migration[5.0]
  def change
    create_table :pedido_operacao_historicos do |t|
      t.references :pedido_operacao, foreign_key: true
      t.string :status
      t.references :usuario, foreign_key: true
      t.string :motivo

      t.timestamps
    end
  end
end
