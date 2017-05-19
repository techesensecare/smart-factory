class AddQuantidadeProduzidaToPedidoOperacoes < ActiveRecord::Migration[5.0]
  def change
    add_column :pedido_operacoes, :quantidade_produzida, :integer
  end
end
