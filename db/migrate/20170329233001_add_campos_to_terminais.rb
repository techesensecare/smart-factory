class AddCamposToTerminais < ActiveRecord::Migration[5.0]
  def change
    add_column :terminais, :marca, :string
    add_column :terminais, :identificacao, :string
    add_column :terminais, :observacoes, :text
  end
end
