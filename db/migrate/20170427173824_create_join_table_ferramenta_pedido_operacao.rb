class CreateJoinTableFerramentaPedidoOperacao < ActiveRecord::Migration[5.0]
  def change
    create_join_table :ferramentas, :pedido_operacoes do |t|
      # t.index [:ferramenta_id, :pedido_operacao_id]
      # t.index [:pedido_operacao_id, :ferramenta_id]
    end
  end
end
