class AddDemaisCamposToUsuarios < ActiveRecord::Migration[5.0]
  def change
    add_column :usuarios, :cpf, :string
    add_column :usuarios, :rg, :string
    add_column :usuarios, :data_nascimento, :date
    add_column :usuarios, :tipo_sanguineo, :string
    add_column :usuarios, :nacionalidade, :string
    add_column :usuarios, :passaporte, :string
    add_column :usuarios, :endereco, :text
    add_column :usuarios, :telefone_fixo, :string
    add_column :usuarios, :telefone_movel, :string
    add_column :usuarios, :cargo, :string
    add_column :usuarios, :data_admissao, :date
    add_column :usuarios, :observacoes, :text
  end
end
