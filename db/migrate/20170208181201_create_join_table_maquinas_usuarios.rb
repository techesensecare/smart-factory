class CreateJoinTableMaquinasUsuarios < ActiveRecord::Migration[5.0]
  def change
    create_join_table :maquinas, :usuarios do |t|
      # t.index [:maquina_id, :usuario_id]
      # t.index [:usuario_id, :maquina_id]
    end
  end
end
