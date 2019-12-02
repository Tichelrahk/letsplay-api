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

ActiveRecord::Schema.define(version: 2019_12_02_094218) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "confirmations", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "event_id"
    t.string "status"
    t.boolean "not_attended"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_confirmations_on_event_id"
    t.index ["user_id"], name: "index_confirmations_on_user_id"
  end

  create_table "events", force: :cascade do |t|
    t.date "date"
    t.time "start"
    t.time "end"
    t.string "message"
    t.string "name"
    t.integer "price"
    t.text "description"
    t.bigint "user_id"
    t.integer "slots"
    t.boolean "completed"
    t.bigint "location_id"
    t.boolean "private"
    t.boolean "prepayment"
    t.boolean "selective"
    t.string "status"
    t.boolean "destroyed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_id"], name: "index_events_on_location_id"
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "address"
    t.float "longitude"
    t.float "latitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.text "bio"
    t.string "open_id"
    t.string "wechat_id"
    t.string "location"
    t.string "profile_picture"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "confirmations", "events"
  add_foreign_key "confirmations", "users"
  add_foreign_key "events", "locations"
  add_foreign_key "events", "users"
end
