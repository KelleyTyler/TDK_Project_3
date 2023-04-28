# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_04_25_182757) do
  create_table "card_decks", force: :cascade do |t|
    t.integer "usr_id"
    t.string "name"
    t.integer "user_id"
  end

  create_table "cards", force: :cascade do |t|
    t.integer "deck_id"
    t.text "card_q"
    t.text "card_a"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password"
    t.string "role"
  end

  add_foreign_key "card_decks", "users"
  add_foreign_key "cards", "card_decks", column: "deck_id"
end
