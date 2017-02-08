class CreateTerminais < ActiveRecord::Migration[5.0]
  def change
    create_table :terminais do |t|
      t.string :descricao

      t.timestamps
    end
  end
end
