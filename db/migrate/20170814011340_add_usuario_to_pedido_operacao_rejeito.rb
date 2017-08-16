class AddUsuarioToPedidoOperacaoRejeito < ActiveRecord::Migration[5.1]
  def change
    add_column :pedido_operacao_rejeitos, :usuario_id, :integer
    PedidoOperacaoRejeito.all.each do |p|
      p.send(:set_usuario)
      p.save!
    end
  end
end
