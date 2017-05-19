class AddPrioridadeToPedidoOperacoes < ActiveRecord::Migration[5.0]
  def change
    add_column :pedido_operacoes, :prioridade, :integer, default: 0 
  end
end
