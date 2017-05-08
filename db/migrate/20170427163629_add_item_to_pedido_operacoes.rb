class AddItemToPedidoOperacoes < ActiveRecord::Migration[5.0]
  def change
    add_column :pedido_operacoes, :pedido_item_id, :integer
  end
end
