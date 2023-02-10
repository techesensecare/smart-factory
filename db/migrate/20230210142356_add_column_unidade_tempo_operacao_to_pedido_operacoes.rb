class AddColumnUnidadeTempoOperacaoToPedidoOperacoes < ActiveRecord::Migration[5.1]
  def change
    add_column :pedido_operacoes, :unidade_tempo_operacao, :string
  end
end
