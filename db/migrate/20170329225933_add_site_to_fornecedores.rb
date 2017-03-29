class AddSiteToFornecedores < ActiveRecord::Migration[5.0]
  def change
    add_column :fornecedores, :site, :string
  end
end
