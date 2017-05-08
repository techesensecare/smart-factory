class AddDescricaoToPedidos < ActiveRecord::Migration[5.0]
  def change
    add_column :pedidos, :descricao, :string
  end
end
