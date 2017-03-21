class AddPrazoToPedidos < ActiveRecord::Migration[5.0]
  def change
    add_column :pedidos, :prazo, :date
  end
end
