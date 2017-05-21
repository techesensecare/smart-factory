class AddMotivoUltimaPausaToPedidoOperacoes < ActiveRecord::Migration[5.0]
  def change
    add_column :pedido_operacoes, :motivo_ultima_pausa, :string
  end
end
