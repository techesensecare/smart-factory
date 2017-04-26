class CreateAnexos < ActiveRecord::Migration[5.0]
  def change
    create_table :anexos do |t|
      t.string :anexavel_type
      t.integer :anexavel_id

      # Campos utilizandos quando anexo é um desenho.
      t.string :descricao
      t.string :codigo
      t.integer :revisao, default: 1

      t.timestamps
    end
  end
end
