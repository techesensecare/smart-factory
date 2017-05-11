class AddStatusToMaquinas < ActiveRecord::Migration[5.0]
  def change
    add_column :maquinas, :status, :string
  end
end
