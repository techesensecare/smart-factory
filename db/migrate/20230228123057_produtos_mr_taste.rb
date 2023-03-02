class ProdutosMrTaste < ActiveRecord::Migration[5.1]
  def change
    create_table :produtos_mr_tastes do |t|
      t.integer :codigo_ordem_producao
      t.string :materia_prima
      t.float :quantidade
      t.string :unidade_medida
      t.string :lote
      t.timestamps
    end
  end
end