class CreateJoinTableMaquinasTerminais < ActiveRecord::Migration[5.0]
  def change
    create_join_table :maquinas, :terminais do |t|
      # t.index [:maquina_id, :terminal_id]
      # t.index [:terminal_id, :maquina_id]
    end
  end
end
