class CreateContatos < ActiveRecord::Migration[5.0]
  def change
    create_table :contatos do |t|
      t.string :nome
      t.string :cargo
      t.string :departamento
      t.string :telefone_fixo
      t.string :telefone_celular
      t.string :email
      t.text :observacoes
      t.integer :cliente_id

      t.timestamps
    end
  end
end
