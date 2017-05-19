class CreatePedidoOperacaoRejeitos < ActiveRecord::Migration[5.0]
  def change
    create_table :pedido_operacao_rejeitos do |t|
      t.references :pedido_operacao, foreign_key: true
      t.references :rejeito, foreign_key: true
      t.integer :quantidade
      t.string  :observacao

      t.timestamps
    end
  end
end
