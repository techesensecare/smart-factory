class CreateComposicaoProdutos < ActiveRecord::Migration[5.1]
  def change
    create_table :composicao_produtos do |t|
      t.integer :produto_id
      t.integer :sub_produto_id
      t.integer :componente_id
      t.integer :materias_prima_id
    end
  end
end
