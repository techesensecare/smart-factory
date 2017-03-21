class CreateRejeitos < ActiveRecord::Migration[5.0]
  def change
    create_table :rejeitos do |t|
      t.string :descricao

      t.timestamps
    end
  end
end
