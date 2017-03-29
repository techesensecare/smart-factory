class AddCamposToMaquinas < ActiveRecord::Migration[5.0]
  def change
    add_column :maquinas, :modelo, :string
    add_column :maquinas, :fabricante, :string
    add_column :maquinas, :ano_fabricacao, :string
    add_column :maquinas, :ano_compra, :string
    add_column :maquinas, :observacao, :text
    add_column :maquinas, :codigo_interno, :string
  end
end
