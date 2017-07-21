class AddFornecedorIdToContatos < ActiveRecord::Migration[5.0]
  def change
    add_column :contatos, :fornecedor_id, :integer
  end
end
