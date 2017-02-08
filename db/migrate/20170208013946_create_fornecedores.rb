class CreateFornecedores < ActiveRecord::Migration[5.0]
  def change
    create_table :fornecedores do |t|
      t.string :nome
      t.string :telefone
      t.string :email

      t.timestamps
    end
  end
end
