class CreateParadas < ActiveRecord::Migration[5.0]
  def change
    create_table :paradas do |t|
      t.string :descricao

      t.timestamps
    end
  end
end
