json.extract! produto, :id, :codigo, :descricao, :materia_prima, :tipo, :created_at, :updated_at
json.url produto_url(produto, format: :json)