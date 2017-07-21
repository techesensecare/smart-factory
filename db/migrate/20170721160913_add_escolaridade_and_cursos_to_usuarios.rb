class AddEscolaridadeAndCursosToUsuarios < ActiveRecord::Migration[5.0]
  def change
    add_column :usuarios, :escolaridade, :string
    add_column :usuarios, :cursos, :text
  end
end
