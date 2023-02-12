# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20230212152131) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "anexos", id: :serial, force: :cascade do |t|
    t.string "anexavel_type"
    t.integer "anexavel_id"
    t.string "descricao"
    t.string "codigo"
    t.integer "revisao", default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "arquivo_file_name"
    t.string "arquivo_content_type"
    t.integer "arquivo_file_size"
    t.datetime "arquivo_updated_at"
    t.boolean "codigo_automatico", default: true
  end

  create_table "celulas", id: :serial, force: :cascade do |t|
    t.string "descricao"
    t.integer "centro_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "codigo_automatico", default: true
    t.string "codigo"
    t.index ["centro_id"], name: "index_celulas_on_centro_id"
  end

  create_table "celulas_maquinas", id: false, force: :cascade do |t|
    t.bigint "celula_id", null: false
    t.bigint "maquina_id", null: false
  end

  create_table "centros", id: :serial, force: :cascade do |t|
    t.string "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "codigo_automatico", default: true
    t.string "codigo"
  end

  create_table "clientes", id: :serial, force: :cascade do |t|
    t.string "nome"
    t.string "telefone"
    t.string "email"
    t.text "endereco"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "codigo_automatico", default: true
    t.string "codigo"
    t.string "cnpj"
    t.string "ie"
    t.string "website"
    t.text "observacoes"
    t.string "personalizado"
  end

  create_table "componentes", force: :cascade do |t|
    t.string "descricao"
    t.string "unidade_de_medida"
    t.string "tipo"
    t.integer "saldo"
    t.integer "preco"
    t.string "prazo_de_entrega"
    t.string "marcas_homologadas"
    t.integer "lote_minimo"
    t.integer "produto_id"
    t.integer "sub_produto_id"
    t.string "nivel_de_comunizacao"
  end

  create_table "composicao_produtos", force: :cascade do |t|
    t.integer "produto_id"
    t.integer "sub_produto_id"
    t.integer "componente_id"
    t.integer "materias_prima_id"
  end

  create_table "contatos", id: :serial, force: :cascade do |t|
    t.string "nome"
    t.string "cargo"
    t.string "departamento"
    t.string "telefone_fixo"
    t.string "telefone_celular"
    t.string "email"
    t.text "observacoes"
    t.integer "cliente_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "fornecedor_id"
  end

  create_table "cronometros", id: :serial, force: :cascade do |t|
    t.integer "pedido_operacao_id"
    t.integer "maquina_id"
    t.string "tipo"
    t.string "motivo"
    t.datetime "inicio"
    t.datetime "fim"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "tempo"
    t.index ["maquina_id"], name: "index_cronometros_on_maquina_id"
    t.index ["pedido_operacao_id"], name: "index_cronometros_on_pedido_operacao_id"
  end

  create_table "embalagens", force: :cascade do |t|
    t.string "descricao"
    t.float "massa"
    t.string "unidade"
  end

  create_table "enderecos", id: :serial, force: :cascade do |t|
    t.string "logradouro"
    t.string "numero"
    t.string "bairro"
    t.string "complemento"
    t.string "cidade"
    t.string "estado"
    t.string "tipo"
    t.string "cep"
    t.integer "enderecable_id"
    t.string "enderecable_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "etapas", id: :serial, force: :cascade do |t|
    t.integer "pedido_id"
    t.integer "etapa_id"
    t.integer "maquina_id"
    t.string "descricao"
    t.integer "quantidade"
    t.datetime "data_entrega"
    t.integer "dependencia"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "depende_de_id"
  end

  create_table "ferramentas", id: :serial, force: :cascade do |t|
    t.string "descricao"
    t.string "codigo"
    t.string "unidade_medida"
    t.string "tipo"
    t.integer "quantidade"
    t.text "observacao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "codigo_automatico", default: true
  end

  create_table "ferramentas_operacoes", id: false, force: :cascade do |t|
    t.bigint "ferramenta_id", null: false
    t.bigint "operacao_id", null: false
  end

  create_table "ferramentas_pedido_operacoes", id: false, force: :cascade do |t|
    t.bigint "ferramenta_id", null: false
    t.bigint "pedido_operacao_id", null: false
  end

  create_table "fornecedores", id: :serial, force: :cascade do |t|
    t.string "nome"
    t.string "telefone"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "cnpj"
    t.string "ie"
    t.text "observacoes"
    t.string "site"
    t.boolean "codigo_automatico", default: true
    t.string "codigo"
  end

  create_table "item_pedidos", id: :serial, force: :cascade do |t|
    t.integer "pedido_id"
    t.string "descricao_produto"
    t.integer "produto_id"
    t.integer "quantidade"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pedido_id"], name: "index_item_pedidos_on_pedido_id"
    t.index ["produto_id"], name: "index_item_pedidos_on_produto_id"
  end

  create_table "items_producaos", force: :cascade do |t|
    t.integer "pedido_id"
    t.integer "produto_id"
    t.integer "pedido_item_id"
    t.integer "peso"
    t.string "unidade"
    t.string "observacao"
    t.integer "operacao_id"
  end

  create_table "maquina_historicos", id: :serial, force: :cascade do |t|
    t.integer "maquina_id"
    t.integer "usuario_id"
    t.string "status"
    t.integer "pedido_operacao_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "fim"
    t.integer "segundos"
    t.index ["maquina_id"], name: "index_maquina_historicos_on_maquina_id"
    t.index ["pedido_operacao_id"], name: "index_maquina_historicos_on_pedido_operacao_id"
    t.index ["usuario_id"], name: "index_maquina_historicos_on_usuario_id"
  end

  create_table "maquinas", id: :serial, force: :cascade do |t|
    t.string "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "modelo"
    t.string "fabricante"
    t.string "ano_fabricacao"
    t.string "ano_compra"
    t.text "observacao"
    t.string "codigo_interno"
    t.string "foto_file_name"
    t.string "foto_content_type"
    t.integer "foto_file_size"
    t.datetime "foto_updated_at"
    t.string "status"
    t.string "codigo"
    t.boolean "codigo_automatico", default: true
    t.date "data_fabricacao"
    t.date "data_compra"
  end

  create_table "maquinas_terminais", id: false, force: :cascade do |t|
    t.bigint "maquina_id", null: false
    t.bigint "terminal_id", null: false
  end

  create_table "maquinas_usuarios", id: false, force: :cascade do |t|
    t.bigint "maquina_id", null: false
    t.bigint "usuario_id", null: false
  end

  create_table "materia_primas", id: :serial, force: :cascade do |t|
    t.integer "produto_id"
    t.integer "produto_usado_id"
    t.integer "quantidade"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "tolerancia_inferior"
    t.float "tolerancia_superior"
  end

  create_table "materias_primas", force: :cascade do |t|
    t.string "descricao"
    t.string "unidade_de_medida"
    t.string "tipo"
    t.integer "saldo"
    t.integer "preco"
    t.string "prazo_de_entrega"
    t.string "marcas_homologadas"
    t.integer "lote_minimo"
    t.integer "produto_id"
    t.integer "sub_produto_id"
    t.string "nivel_de_comunizacao"
  end

  create_table "movimentos", id: :serial, force: :cascade do |t|
    t.integer "produto_id"
    t.string "tipo"
    t.integer "quantidade"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "observacao"
    t.index ["produto_id"], name: "index_movimentos_on_produto_id"
  end

  create_table "operacoes", id: :serial, force: :cascade do |t|
    t.integer "produto_id"
    t.integer "ordem"
    t.string "descricao"
    t.integer "maquina_id"
    t.text "observacao"
    t.integer "tempo_setup"
    t.integer "tempo_operacao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "produto_usado_id"
    t.string "unidade_tempo_operacao"
    t.float "tolerancia_inferior"
    t.float "tolerancia_superior"
    t.index ["maquina_id"], name: "index_operacoes_on_maquina_id"
    t.index ["produto_id"], name: "index_operacoes_on_produto_id"
  end

  create_table "paradas", id: :serial, force: :cascade do |t|
    t.string "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "codigo_automatico", default: true
    t.string "codigo"
  end

  create_table "pedido_operacao_historicos", id: :serial, force: :cascade do |t|
    t.integer "pedido_operacao_id"
    t.string "status"
    t.integer "usuario_id"
    t.string "motivo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "maquina_id"
    t.datetime "fim"
    t.integer "segundos"
    t.index ["maquina_id"], name: "index_pedido_operacao_historicos_on_maquina_id"
    t.index ["pedido_operacao_id"], name: "index_pedido_operacao_historicos_on_pedido_operacao_id"
    t.index ["usuario_id"], name: "index_pedido_operacao_historicos_on_usuario_id"
  end

  create_table "pedido_operacao_rejeitos", id: :serial, force: :cascade do |t|
    t.integer "pedido_operacao_id"
    t.integer "rejeito_id"
    t.integer "quantidade"
    t.string "observacao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "usuario_id"
    t.index ["pedido_operacao_id"], name: "index_pedido_operacao_rejeitos_on_pedido_operacao_id"
    t.index ["rejeito_id"], name: "index_pedido_operacao_rejeitos_on_rejeito_id"
  end

  create_table "pedido_operacoes", id: :serial, force: :cascade do |t|
    t.integer "pedido_id"
    t.integer "produto_id"
    t.integer "ordem"
    t.string "descricao"
    t.integer "maquina_id"
    t.text "observacao"
    t.integer "tempo_setup"
    t.integer "tempo_operacao"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "pedido_item_id"
    t.integer "quantidade"
    t.integer "prioridade", default: 0
    t.integer "quantidade_produzida"
    t.string "motivo_desmembramento"
    t.string "motivo_ultima_pausa"
    t.string "unidade_tempo_operacao"
    t.index ["maquina_id"], name: "index_pedido_operacoes_on_maquina_id"
    t.index ["pedido_id"], name: "index_pedido_operacoes_on_pedido_id"
    t.index ["produto_id"], name: "index_pedido_operacoes_on_produto_id"
  end

  create_table "pedidos", id: :serial, force: :cascade do |t|
    t.integer "cliente_id"
    t.string "numero"
    t.text "observacao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "prazo"
    t.string "status"
    t.string "descricao"
    t.integer "responsavel_id"
    t.string "codigo_pedido_cliente"
    t.index ["cliente_id"], name: "index_pedidos_on_cliente_id"
  end

  create_table "produtos", id: :serial, force: :cascade do |t|
    t.string "codigo"
    t.string "descricao"
    t.string "unidade_medida"
    t.string "tipo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "saldo", default: 0
    t.boolean "codigo_automatico", default: true
    t.string "classificacao_fiscal"
    t.boolean "composto"
    t.integer "embalagem_id"
  end

  create_table "rejeitos", id: :serial, force: :cascade do |t|
    t.string "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "codigo_automatico", default: true
    t.string "codigo"
  end

  create_table "sub_produtos", force: :cascade do |t|
    t.string "descricao"
    t.string "unidade_de_medida"
    t.string "tipo"
    t.integer "saldo"
    t.integer "preco"
    t.integer "preco_de_venda"
    t.string "prazo_de_entrega"
    t.string "marcas_homologadas"
    t.integer "lote_minimo"
    t.integer "produto_id"
    t.string "nivel_de_comunizacao"
  end

  create_table "terminais", id: :serial, force: :cascade do |t|
    t.string "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "marca"
    t.string "identificacao"
    t.text "observacoes"
    t.string "codigo"
    t.boolean "codigo_automatico", default: true
  end

  create_table "turnos", id: :serial, force: :cascade do |t|
    t.string "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "usuarios", id: :serial, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nome"
    t.string "perfil"
    t.boolean "ativo"
    t.string "avatar_file_name"
    t.string "avatar_content_type"
    t.integer "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string "cpf"
    t.string "rg"
    t.date "data_nascimento"
    t.string "tipo_sanguineo"
    t.string "nacionalidade"
    t.string "passaporte"
    t.text "endereco"
    t.string "telefone_fixo"
    t.string "telefone_movel"
    t.string "cargo"
    t.date "data_admissao"
    t.text "observacoes"
    t.integer "turno_id"
    t.boolean "codigo_automatico", default: true
    t.string "codigo"
    t.string "escolaridade"
    t.text "cursos"
    t.index ["email"], name: "index_usuarios_on_email", unique: true
    t.index ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true
    t.index ["turno_id"], name: "index_usuarios_on_turno_id"
  end

  create_table "versions", force: :cascade do |t|
    t.string "item_type", null: false
    t.integer "item_id", null: false
    t.string "event", null: false
    t.string "whodunnit"
    t.text "object"
    t.datetime "created_at"
    t.index ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"
  end

  add_foreign_key "celulas", "centros"
  add_foreign_key "cronometros", "maquinas"
  add_foreign_key "cronometros", "pedido_operacoes"
  add_foreign_key "item_pedidos", "pedidos"
  add_foreign_key "item_pedidos", "produtos"
  add_foreign_key "maquina_historicos", "maquinas"
  add_foreign_key "maquina_historicos", "pedido_operacoes"
  add_foreign_key "maquina_historicos", "usuarios"
  add_foreign_key "movimentos", "produtos"
  add_foreign_key "operacoes", "maquinas"
  add_foreign_key "operacoes", "produtos"
  add_foreign_key "pedido_operacao_historicos", "maquinas"
  add_foreign_key "pedido_operacao_historicos", "pedido_operacoes"
  add_foreign_key "pedido_operacao_historicos", "usuarios"
  add_foreign_key "pedido_operacao_rejeitos", "pedido_operacoes"
  add_foreign_key "pedido_operacao_rejeitos", "rejeitos"
  add_foreign_key "pedido_operacoes", "maquinas"
  add_foreign_key "pedido_operacoes", "pedidos"
  add_foreign_key "pedido_operacoes", "produtos"
  add_foreign_key "pedidos", "clientes"
  add_foreign_key "usuarios", "turnos"
end
