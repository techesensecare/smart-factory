class AddCodigoAutomaticoToCadastros < ActiveRecord::Migration[5.0]
  def change
    tabelas = %w(clientes fornecedores centros produtos anexos usuarios
                 ferramentas paradas celulas rejeitos)
    tabelas.each do |tabela|
      add_column tabela, :codigo_automatico, :boolean,  default: true
    end

    # Códigos apenas para quem ainda não tem.
    (tabelas - %w(ferramentas produtos anexos)).each do |tabela|
      add_column tabela, :codigo, :string
      execute "update #{tabela} set codigo = id"
    end
  end
end
