class CreateEnderecos < ActiveRecord::Migration[5.0]
  def change
    create_table :enderecos do |t|
      t.string :logradouro
      t.string :numero
      t.string :bairro
      t.string :complemento
      t.string :cidade
      t.string :estado
      t.string :tipo
      t.string :cep
      t.integer :enderecable_id
      t.string :enderecable_type

      t.timestamps
    end
  end
end
