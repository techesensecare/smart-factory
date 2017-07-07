class AddCamposToClientes < ActiveRecord::Migration[5.0]
  def change
    add_column :clientes, :cnpj, :string
    add_column :clientes, :ie, :string
    add_column :clientes, :website, :string
    add_column :clientes, :observacoes, :text
  end
end
