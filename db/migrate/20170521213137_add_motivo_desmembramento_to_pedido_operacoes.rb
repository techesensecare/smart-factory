class AddMotivoDesmembramentoToPedidoOperacoes < ActiveRecord::Migration[5.0]
  def change
    add_column :pedido_operacoes, :motivo_desmembramento, :string
  end
end
