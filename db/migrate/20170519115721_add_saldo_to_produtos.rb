class AddSaldoToProdutos < ActiveRecord::Migration[5.0]
  def change
    add_column :produtos, :saldo, :integer, default: 0
  end
end
