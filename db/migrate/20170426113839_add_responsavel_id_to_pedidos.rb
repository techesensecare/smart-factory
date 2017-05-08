class AddResponsavelIdToPedidos < ActiveRecord::Migration[5.0]
  def change
    add_column :pedidos, :responsavel_id, :integer
  end
end
