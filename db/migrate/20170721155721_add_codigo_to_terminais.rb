class AddCodigoToTerminais < ActiveRecord::Migration[5.0]
  def change
    add_column :terminais, :codigo, :string
    add_column :terminais, :codigo_automatico, :boolean, default: true
    execute "update terminais set codigo = id"
  end
end
