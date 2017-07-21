class AddClassificacaoFiscalToProdutos < ActiveRecord::Migration[5.0]
  def change
    add_column :produtos, :classificacao_fiscal, :string
  end
end
