class CreateEmbalagens < ActiveRecord::Migration[5.1]
  def change
    create_table :embalagens do |t|
      t.string :descricao
      t.float :massa
      t.string :unidade
    end
  end
end
