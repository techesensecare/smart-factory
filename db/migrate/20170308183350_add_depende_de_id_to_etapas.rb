class AddDependeDeIdToEtapas < ActiveRecord::Migration[5.0]
  def change
    add_column :etapas, :depende_de_id, :integer
  end
end
