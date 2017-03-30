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

ActiveRecord::Schema.define(version: 20170330183727) do

  create_table "card_types", force: :cascade do |t|
    t.string "type",           null: false
    t.string "name",           null: false
    t.text   "description"
    t.string "image_filename"
  end

  create_table "cards", force: :cascade do |t|
    t.integer "game_id",                   null: false
    t.integer "location",      default: 0, null: false
    t.integer "games_user_id"
    t.integer "position"
    t.integer "card_type_id",              null: false
  end

  create_table "characters", force: :cascade do |t|
    t.string  "name",                     null: false
    t.text    "description"
    t.integer "ability_type"
    t.integer "health",       default: 4, null: false
  end

  create_table "games", force: :cascade do |t|
    t.string "name", null: false
  end

  create_table "players", force: :cascade do |t|
    t.integer "user_id",                  null: false
    t.integer "game_id",                  null: false
    t.integer "character_id"
    t.integer "role_id"
    t.integer "health",       default: 4
  end

  create_table "roles", force: :cascade do |t|
    t.string "type",        default: "Outlaw", null: false
    t.text   "description"
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name",  null: false
    t.string   "last_name",   null: false
    t.string   "email"
    t.string   "password"
    t.string   "nickname"
    t.integer  "total_score"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

end
