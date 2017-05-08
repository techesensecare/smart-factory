class CreateJoinTableFerramentaOperacao < ActiveRecord::Migration[5.0]
  def change
    create_join_table :ferramentas, :operacoes do |t|
      # t.index [:ferramenta_id, :operacao_id]
      # t.index [:operacao_id, :ferramenta_id]
    end
  end
end
