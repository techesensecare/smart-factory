class ChangePesoToFloatInItemsProducaos < ActiveRecord::Migration[5.1]
  def change
    change_column :items_producaos, :peso, :float
  end
end
