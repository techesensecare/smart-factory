class AddUnidadeTempoOperacaoToOperacoes < ActiveRecord::Migration[5.1]
  def change
    add_column :operacoes, :unidade_tempo_operacao, :string
  end
end
