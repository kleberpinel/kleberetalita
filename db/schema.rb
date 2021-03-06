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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130711181338) do

  create_table "albums", :force => true do |t|
    t.string   "nome"
    t.text     "descricao"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "authentications", :force => true do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "autors", :force => true do |t|
    t.string   "nome"
    t.string   "titulo_blog"
    t.text     "sobre"
    t.string   "nome_menu"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categoria_cotas", :force => true do |t|
    t.string   "nome"
    t.string   "descricao"
    t.string   "imagem"
    t.float    "totalArrecadado"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categorias", :force => true do |t|
    t.string   "nome"
    t.string   "descricao"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ckeditor_assets", :force => true do |t|
    t.string   "data_file_name",                  :null => false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    :limit => 30
    t.string   "type",              :limit => 30
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], :name => "idx_ckeditor_assetable"
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], :name => "idx_ckeditor_assetable_type"

  create_table "comments", :force => true do |t|
    t.string   "commenter"
    t.text     "body"
    t.string   "email"
    t.integer  "post_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["post_id"], :name => "index_comments_on_post_id"

  create_table "convidados", :force => true do |t|
    t.string   "nome"
    t.boolean  "confimacao_presenca_cerimonia"
    t.boolean  "confimacao_presenca_festa"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cotas", :force => true do |t|
    t.string   "nome"
    t.string   "descricao"
    t.float    "valor"
    t.string   "imagem"
    t.integer  "cotas"
    t.integer  "totalVendido"
    t.float    "totalArrecadado"
    t.integer  "categoria_cota_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fotos", :force => true do |t|
    t.string   "nome"
    t.string   "picture"
    t.text     "descricao"
    t.integer  "width"
    t.integer  "height"
    t.integer  "album_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", :force => true do |t|
    t.text     "texto"
    t.string   "titulo"
    t.text     "descricao"
    t.date     "data"
    t.string   "picture1"
    t.string   "picture2"
    t.string   "picture3"
    t.boolean  "publicado"
    t.integer  "categoria_id"
    t.integer  "autor_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tags", :force => true do |t|
    t.string   "name"
    t.integer  "post_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tags", ["post_id"], :name => "index_tags_on_post_id"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "nome"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "de_onde"
    t.string   "nome_convite"
    t.string   "convidados"
    t.string   "nivel_certeza"
    t.string   "endereco"
    t.string   "origem"
    t.string   "numero_telefone"
    t.boolean  "disponivel_festa"
    t.boolean  "disponivel_cerimonia"
    t.boolean  "rsvp_executado"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["nome_convite"], :name => "unique_name", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
