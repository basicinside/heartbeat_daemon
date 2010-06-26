# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100622054220) do

  create_table "antennas", :force => true do |t|
    t.string   "name"
    t.string   "vendor"
    t.string   "polarity"
    t.string   "type"
    t.integer  "height"
    t.integer  "direction"
    t.integer  "gain"
    t.integer  "angle_horizontal"
    t.integer  "angle_vertical"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bugreports", :force => true do |t|
    t.string   "name"
    t.string   "version"
    t.integer  "hardware_id"
    t.text     "beschreibung"
    t.text     "uci"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "countries", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "groups", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "homepage"
    t.integer  "province_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "hardwares", :force => true do |t|
    t.string   "name"
    t.string   "hersteller"
    t.text     "beschreibung"
    t.string   "link"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "heartbeats", :force => true do |t|
    t.date     "date"
    t.integer  "node_id"
    t.integer  "neighbors"
    t.integer  "clients"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "locations", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "plz"
    t.integer  "province_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "nodes", :force => true do |t|
    t.string   "name"
    t.string   "node_id"
    t.decimal  "lat"
    t.decimal  "lon"
    t.string   "version"
    t.text     "uci"
    t.date     "last_seen"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.integer  "user_id"
    t.integer  "device_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "open_id_authentication_associations", :force => true do |t|
    t.binary  "server_url"
    t.string  "handle"
    t.binary  "secret"
    t.integer "issued"
    t.integer "lifetime"
    t.string  "assoc_type"
  end

  create_table "open_id_authentication_nonces", :force => true do |t|
    t.string  "nonce"
    t.integer "created"
  end

  create_table "open_id_authentication_settings", :force => true do |t|
    t.string "setting"
    t.binary "value"
  end

  create_table "parties", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "homepage"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "photos", :force => true do |t|
    t.integer  "node_id"
    t.string   "data_file_name"
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.datetime "data_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "photos", ["node_id"], :name => "index_photos_on_node_id"

  create_table "provinces", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "homepage"
    t.integer  "country_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "scores", :force => true do |t|
    t.integer  "node_id"
    t.integer  "score"
    t.integer  "variant"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.integer  "role_id"
    t.integer  "party_id"
    t.integer  "location_id"
    t.integer  "group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "openid_identifier"
  end

end
