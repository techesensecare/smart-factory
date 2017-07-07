class AddCodigoAutomaticoToMaquinas < ActiveRecord::Migration[5.0]
  def change
    add_column :maquinas, :codigo_automatico, :boolean, default: true
    Maquina.update_all "codigo = id"
  end
end
