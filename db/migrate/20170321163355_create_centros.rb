class CreateCentros < ActiveRecord::Migration[5.0]
  def change
    create_table :centros do |t|
      t.string :descricao

      t.timestamps
    end
  end
end
