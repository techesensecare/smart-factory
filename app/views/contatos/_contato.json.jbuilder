json.extract! contato, :id, :nome, :cargo, :departamento, :telefone_fixo, :telefone_celular, :email, :observacoes, :cliente_id, :created_at, :updated_at
json.url contato_url(contato, format: :json)