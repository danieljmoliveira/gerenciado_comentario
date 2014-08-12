# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140812102716) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "banco_ideia", force: true do |t|
    t.string   "nome"
    t.string   "email"
    t.string   "estado"
    t.string   "cidade"
    t.string   "telefone"
    t.string   "lista_tipo"
    t.string   "titulo"
    t.text     "texto_ideia"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "banco_ideia_temas", force: true do |t|
    t.integer  "banco_ideium_id"
    t.integer  "tema_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cidade_estados", force: true do |t|
    t.string   "estado"
    t.string   "cidade"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ideia_votos", force: true do |t|
    t.string   "voto"
    t.integer  "banco_ideium_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pessoas", force: true do |t|
    t.string   "nome"
    t.string   "email"
    t.string   "estado"
    t.string   "cidade"
    t.string   "telefone"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "temas", force: true do |t|
    t.string   "descricao"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
