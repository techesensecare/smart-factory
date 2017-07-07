class AddCodigoToMaquinas < ActiveRecord::Migration[5.0]
  def change
    add_column :maquinas, :codigo, :string
  end
end
