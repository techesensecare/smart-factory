class AddTurnoToUsuarios < ActiveRecord::Migration[5.0]
  def change
    add_reference :usuarios, :turno, foreign_key: true
  end
end
