class AddProdutoUsadoIdToOperacoes < ActiveRecord::Migration[5.1]
  def change
    add_column :operacoes, :produto_usado_id, :integer
  end
end
