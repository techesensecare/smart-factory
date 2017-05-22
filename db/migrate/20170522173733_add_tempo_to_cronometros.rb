class AddTempoToCronometros < ActiveRecord::Migration[5.0]
  def change
    add_column :cronometros, :tempo, :integer
  end
end
