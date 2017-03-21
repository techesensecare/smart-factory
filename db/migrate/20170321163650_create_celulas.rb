class CreateCelulas < ActiveRecord::Migration[5.0]
  def change
    create_table :celulas do |t|
      t.string :descricao
      t.references :centro, foreign_key: true

      t.timestamps
    end
  end
end
