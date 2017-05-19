class AddObservacaoToMovimentos < ActiveRecord::Migration[5.0]
  def change
    add_column :movimentos, :observacao, :string
  end
end
