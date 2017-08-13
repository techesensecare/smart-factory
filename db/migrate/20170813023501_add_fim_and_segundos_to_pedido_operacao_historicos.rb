class AddFimAndSegundosToPedidoOperacaoHistoricos < ActiveRecord::Migration[5.1]
  def change
    add_column :pedido_operacao_historicos, :fim, :datetime
    add_column :pedido_operacao_historicos, :segundos, :integer

    PedidoOperacaoHistorico.all.each do |h|
      posterior = h.pedido_operacao.historicos.where('created_at > ?', h.created_at).first
      if posterior
        h.fim      = posterior.created_at
        h.segundos = h.fim - h.created_at
        h.save
      end
    end
  end
end
