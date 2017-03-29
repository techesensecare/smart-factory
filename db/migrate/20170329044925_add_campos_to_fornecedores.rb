class AddCamposToFornecedores < ActiveRecord::Migration[5.0]
  def change
    add_column :fornecedores, :cnpj, :string
    add_column :fornecedores, :ie, :string
    add_column :fornecedores, :observacoes, :text
  end
end
