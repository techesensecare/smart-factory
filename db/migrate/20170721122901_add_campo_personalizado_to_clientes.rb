class AddCampoPersonalizadoToClientes < ActiveRecord::Migration[5.0]
  def change
    add_column :clientes, :personalizado, :string
  end
end
