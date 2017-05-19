class CreateMovimentos < ActiveRecord::Migration[5.0]
  def change
    create_table :movimentos do |t|
      t.references :produto, foreign_key: true
      t.string :tipo
      t.integer :quantidade

      t.timestamps
    end
  end
end
