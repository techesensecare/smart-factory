class CreateMaquinas < ActiveRecord::Migration[5.0]
  def change
    create_table :maquinas do |t|
      t.string :descricao

      t.timestamps
    end
  end
end
