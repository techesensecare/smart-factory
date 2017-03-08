class CreateClientes < ActiveRecord::Migration[5.0]
  def change
    create_table :clientes do |t|
      t.string :nome
      t.string :telefone
      t.string :email
      t.text :endereco

      t.timestamps
    end
  end
end
