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

ActiveRecord::Schema.define(version: 20170308103311) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clientes", force: :cascade do |t|
    t.string   "nome"
    t.string   "telefone"
    t.string   "email"
    t.text     "endereco"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fornecedores", force: :cascade do |t|
    t.string   "nome"
    t.string   "telefone"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "maquinas", force: :cascade do |t|
    t.string   "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "maquinas_terminais", id: false, force: :cascade do |t|
    t.integer "maquina_id",  null: false
    t.integer "terminal_id", null: false
  end

  create_table "maquinas_usuarios", id: false, force: :cascade do |t|
    t.integer "maquina_id", null: false
    t.integer "usuario_id", null: false
  end

  create_table "pedidos", force: :cascade do |t|
    t.integer  "cliente_id"
    t.string   "numero"
    t.text     "observacao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cliente_id"], name: "index_pedidos_on_cliente_id", using: :btree
  end

  create_table "terminais", force: :cascade do |t|
    t.string   "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "usuarios", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "nome"
    t.string   "perfil"
    t.boolean  "ativo"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.index ["email"], name: "index_usuarios_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "pedidos", "clientes"
end
