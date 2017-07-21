class AddCodigoPedidoClienteToPedidos < ActiveRecord::Migration[5.0]
  def change
    add_column :pedidos, :codigo_pedido_cliente, :string
  end
end
