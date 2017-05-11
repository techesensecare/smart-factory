class AddMaquinaToPedidoOperacaoHistoricos < ActiveRecord::Migration[5.0]
  def change
    add_reference :pedido_operacao_historicos, :maquina, foreign_key: true
  end
end
