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

ActiveRecord::Schema.define(version: 20170721134552) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "anexos", force: :cascade do |t|
    t.string   "anexavel_type"
    t.integer  "anexavel_id"
    t.string   "descricao"
    t.string   "codigo"
    t.integer  "revisao",              default: 1
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "arquivo_file_name"
    t.string   "arquivo_content_type"
    t.integer  "arquivo_file_size"
    t.datetime "arquivo_updated_at"
    t.boolean  "codigo_automatico",    default: true
  end

  create_table "celulas", force: :cascade do |t|
    t.string   "descricao"
    t.integer  "centro_id"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.boolean  "codigo_automatico", default: true
    t.string   "codigo"
    t.index ["centro_id"], name: "index_celulas_on_centro_id", using: :btree
  end

  create_table "celulas_maquinas", id: false, force: :cascade do |t|
    t.integer "celula_id",  null: false
    t.integer "maquina_id", null: false
  end

  create_table "centros", force: :cascade do |t|
    t.string   "descricao"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.boolean  "codigo_automatico", default: true
    t.string   "codigo"
  end

  create_table "clientes", force: :cascade do |t|
    t.string   "nome"
    t.string   "telefone"
    t.string   "email"
    t.text     "endereco"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.boolean  "codigo_automatico", default: true
    t.string   "codigo"
    t.string   "cnpj"
    t.string   "ie"
    t.string   "website"
    t.text     "observacoes"
    t.string   "personalizado"
  end

  create_table "contatos", force: :cascade do |t|
    t.string   "nome"
    t.string   "cargo"
    t.string   "departamento"
    t.string   "telefone_fixo"
    t.string   "telefone_celular"
    t.string   "email"
    t.text     "observacoes"
    t.integer  "cliente_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "fornecedor_id"
  end

  create_table "cronometros", force: :cascade do |t|
    t.integer  "pedido_operacao_id"
    t.integer  "maquina_id"
    t.string   "tipo"
    t.string   "motivo"
    t.datetime "inicio"
    t.datetime "fim"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "tempo"
    t.index ["maquina_id"], name: "index_cronometros_on_maquina_id", using: :btree
    t.index ["pedido_operacao_id"], name: "index_cronometros_on_pedido_operacao_id", using: :btree
  end

  create_table "enderecos", force: :cascade do |t|
    t.string   "logradouro"
    t.string   "numero"
    t.string   "bairro"
    t.string   "complemento"
    t.string   "cidade"
    t.string   "estado"
    t.string   "tipo"
    t.string   "cep"
    t.integer  "enderecable_id"
    t.string   "enderecable_type"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "etapas", force: :cascade do |t|
    t.integer  "pedido_id"
    t.integer  "etapa_id"
    t.integer  "maquina_id"
    t.string   "descricao"
    t.integer  "quantidade"
    t.datetime "data_entrega"
    t.integer  "dependencia"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "depende_de_id"
  end

  create_table "ferramentas", force: :cascade do |t|
    t.string   "descricao"
    t.string   "codigo"
    t.string   "unidade_medida"
    t.string   "tipo"
    t.integer  "quantidade"
    t.text     "observacao"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.boolean  "codigo_automatico", default: true
  end

  create_table "ferramentas_operacoes", id: false, force: :cascade do |t|
    t.integer "ferramenta_id", null: false
    t.integer "operacao_id",   null: false
  end

  create_table "ferramentas_pedido_operacoes", id: false, force: :cascade do |t|
    t.integer "ferramenta_id",      null: false
    t.integer "pedido_operacao_id", null: false
  end

  create_table "fornecedores", force: :cascade do |t|
    t.string   "nome"
    t.string   "telefone"
    t.string   "email"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "cnpj"
    t.string   "ie"
    t.text     "observacoes"
    t.string   "site"
    t.boolean  "codigo_automatico", default: true
    t.string   "codigo"
  end

  create_table "item_pedidos", force: :cascade do |t|
    t.integer  "pedido_id"
    t.string   "descricao_produto"
    t.integer  "produto_id"
    t.integer  "quantidade"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["pedido_id"], name: "index_item_pedidos_on_pedido_id", using: :btree
    t.index ["produto_id"], name: "index_item_pedidos_on_produto_id", using: :btree
  end

  create_table "maquina_historicos", force: :cascade do |t|
    t.integer  "maquina_id"
    t.integer  "usuario_id"
    t.string   "status"
    t.integer  "pedido_operacao_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["maquina_id"], name: "index_maquina_historicos_on_maquina_id", using: :btree
    t.index ["pedido_operacao_id"], name: "index_maquina_historicos_on_pedido_operacao_id", using: :btree
    t.index ["usuario_id"], name: "index_maquina_historicos_on_usuario_id", using: :btree
  end

  create_table "maquinas", force: :cascade do |t|
    t.string   "descricao"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "modelo"
    t.string   "fabricante"
    t.string   "ano_fabricacao"
    t.string   "ano_compra"
    t.text     "observacao"
    t.string   "codigo_interno"
    t.string   "foto_file_name"
    t.string   "foto_content_type"
    t.integer  "foto_file_size"
    t.datetime "foto_updated_at"
    t.string   "status"
    t.string   "codigo"
    t.boolean  "codigo_automatico", default: true
    t.date     "data_fabricacao"
    t.date     "data_compra"
  end

  create_table "maquinas_terminais", id: false, force: :cascade do |t|
    t.integer "maquina_id",  null: false
    t.integer "terminal_id", null: false
  end

  create_table "maquinas_usuarios", id: false, force: :cascade do |t|
    t.integer "maquina_id", null: false
    t.integer "usuario_id", null: false
  end

  create_table "materia_primas", force: :cascade do |t|
    t.integer  "produto_id"
    t.integer  "produto_usado_id"
    t.integer  "quantidade"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "movimentos", force: :cascade do |t|
    t.integer  "produto_id"
    t.string   "tipo"
    t.integer  "quantidade"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "observacao"
    t.index ["produto_id"], name: "index_movimentos_on_produto_id", using: :btree
  end

  create_table "operacoes", force: :cascade do |t|
    t.integer  "produto_id"
    t.integer  "ordem"
    t.string   "descricao"
    t.integer  "maquina_id"
    t.text     "observacao"
    t.integer  "tempo_setup"
    t.integer  "tempo_operacao"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["maquina_id"], name: "index_operacoes_on_maquina_id", using: :btree
    t.index ["produto_id"], name: "index_operacoes_on_produto_id", using: :btree
  end

  create_table "paradas", force: :cascade do |t|
    t.string   "descricao"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.boolean  "codigo_automatico", default: true
    t.string   "codigo"
  end

  create_table "pedido_operacao_historicos", force: :cascade do |t|
    t.integer  "pedido_operacao_id"
    t.string   "status"
    t.integer  "usuario_id"
    t.string   "motivo"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "maquina_id"
    t.index ["maquina_id"], name: "index_pedido_operacao_historicos_on_maquina_id", using: :btree
    t.index ["pedido_operacao_id"], name: "index_pedido_operacao_historicos_on_pedido_operacao_id", using: :btree
    t.index ["usuario_id"], name: "index_pedido_operacao_historicos_on_usuario_id", using: :btree
  end

  create_table "pedido_operacao_rejeitos", force: :cascade do |t|
    t.integer  "pedido_operacao_id"
    t.integer  "rejeito_id"
    t.integer  "quantidade"
    t.string   "observacao"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["pedido_operacao_id"], name: "index_pedido_operacao_rejeitos_on_pedido_operacao_id", using: :btree
    t.index ["rejeito_id"], name: "index_pedido_operacao_rejeitos_on_rejeito_id", using: :btree
  end

  create_table "pedido_operacoes", force: :cascade do |t|
    t.integer  "pedido_id"
    t.integer  "produto_id"
    t.integer  "ordem"
    t.string   "descricao"
    t.integer  "maquina_id"
    t.text     "observacao"
    t.integer  "tempo_setup"
    t.integer  "tempo_operacao"
    t.string   "status"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.integer  "pedido_item_id"
    t.integer  "quantidade"
    t.integer  "prioridade",            default: 0
    t.integer  "quantidade_produzida"
    t.string   "motivo_desmembramento"
    t.string   "motivo_ultima_pausa"
    t.index ["maquina_id"], name: "index_pedido_operacoes_on_maquina_id", using: :btree
    t.index ["pedido_id"], name: "index_pedido_operacoes_on_pedido_id", using: :btree
    t.index ["produto_id"], name: "index_pedido_operacoes_on_produto_id", using: :btree
  end

  create_table "pedidos", force: :cascade do |t|
    t.integer  "cliente_id"
    t.string   "numero"
    t.text     "observacao"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.date     "prazo"
    t.string   "status"
    t.string   "descricao"
    t.integer  "responsavel_id"
    t.string   "codigo_pedido_cliente"
    t.index ["cliente_id"], name: "index_pedidos_on_cliente_id", using: :btree
  end

  create_table "produtos", force: :cascade do |t|
    t.string   "codigo"
    t.string   "descricao"
    t.string   "unidade_medida"
    t.string   "tipo"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.integer  "saldo",             default: 0
    t.boolean  "codigo_automatico", default: true
  end

  create_table "rejeitos", force: :cascade do |t|
    t.string   "descricao"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.boolean  "codigo_automatico", default: true
    t.string   "codigo"
  end

  create_table "terminais", force: :cascade do |t|
    t.string   "descricao"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "marca"
    t.string   "identificacao"
    t.text     "observacoes"
  end

  create_table "turnos", force: :cascade do |t|
    t.string   "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "usuarios", force: :cascade do |t|
    t.string   "email",                  default: "",   null: false
    t.string   "encrypted_password",     default: "",   null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,    null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.string   "nome"
    t.string   "perfil"
    t.boolean  "ativo"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "cpf"
    t.string   "rg"
    t.date     "data_nascimento"
    t.string   "tipo_sanguineo"
    t.string   "nacionalidade"
    t.string   "passaporte"
    t.text     "endereco"
    t.string   "telefone_fixo"
    t.string   "telefone_movel"
    t.string   "cargo"
    t.date     "data_admissao"
    t.text     "observacoes"
    t.integer  "turno_id"
    t.boolean  "codigo_automatico",      default: true
    t.string   "codigo"
    t.index ["email"], name: "index_usuarios_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true, using: :btree
    t.index ["turno_id"], name: "index_usuarios_on_turno_id", using: :btree
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
