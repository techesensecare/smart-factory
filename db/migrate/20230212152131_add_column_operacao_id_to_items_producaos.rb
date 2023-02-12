class AddColumnOperacaoIdToItemsProducaos < ActiveRecord::Migration[5.1]
  def change
    add_column :items_producaos, :operacao_id, :integer
  end
end
