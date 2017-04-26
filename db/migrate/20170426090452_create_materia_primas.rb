class CreateMateriaPrimas < ActiveRecord::Migration[5.0]
  def change
    create_table :materia_primas do |t|
      t.integer :produto_id
      t.integer :produto_usado_id
      t.integer :quantidade

      t.timestamps
    end
  end
end
