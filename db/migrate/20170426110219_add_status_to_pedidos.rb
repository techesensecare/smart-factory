class AddStatusToPedidos < ActiveRecord::Migration[5.0]
  def change
    add_column :pedidos, :status, :string
  end
end
