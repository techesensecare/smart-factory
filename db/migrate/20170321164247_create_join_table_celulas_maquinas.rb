class CreateJoinTableCelulasMaquinas < ActiveRecord::Migration[5.0]
  def change
    create_join_table :celulas, :maquinas do |t|
      # t.index [:celula_id, :maquina_id]
      # t.index [:maquina_id, :celula_id]
    end
  end
end
