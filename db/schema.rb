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

ActiveRecord::Schema.define(version: 20131019130835) do

  create_table "accommodations", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "placements", force: true do |t|
    t.integer  "room_id"
    t.date     "arrival"
    t.date     "departure"
    t.integer  "accommodation_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "placements", ["accommodation_id"], name: "index_placements_on_accommodation_id"
  add_index "placements", ["room_id"], name: "index_placements_on_room_id"

  create_table "reservations", force: true do |t|
    t.integer  "room_id"
    t.date     "arrival"
    t.date     "departure"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "canceled",   default: false
  end

  add_index "reservations", ["room_id"], name: "index_reservations_on_room_id"

  create_table "room_categories", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rooms", force: true do |t|
    t.integer  "number"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rooms", ["category_id"], name: "index_rooms_on_category_id"

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "role"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
