class AddQuantidadeToPedidoOperacoes < ActiveRecord::Migration[5.0]
  def change
    add_column :pedido_operacoes, :quantidade, :integer
  end
end
