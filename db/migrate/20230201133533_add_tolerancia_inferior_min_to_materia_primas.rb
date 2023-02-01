class AddToleranciaInferiorMinToMateriaPrimas < ActiveRecord::Migration[5.1]
  def change
    add_column :materia_primas, :tolerancia_inferior, :float
    add_column :materia_primas, :tolerancia_superior, :float
  end
end
