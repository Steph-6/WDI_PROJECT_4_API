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

ActiveRecord::Schema.define(version: 20170220120126) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "date"
    t.integer  "slots_on_offer"
    t.string   "is_expired"
    t.string   "is_at_capacity"
    t.text     "description"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["user_id"], name: "index_events_on_user_id", using: :btree
  end

  create_table "requests", force: :cascade do |t|
    t.integer  "event_id"
    t.integer  "user_id"
    t.string   "status"
    t.string   "band_name"
    t.string   "bar_name"
    t.integer  "bar_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_requests_on_event_id", using: :btree
    t.index ["user_id"], name: "index_requests_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "name"
    t.string   "password_digest"
    t.string   "bar_location"
    t.string   "band_location"
    t.string   "bar_telephone"
    t.string   "band_telephone"
    t.string   "band_image"
    t.string   "bar_image"
    t.string   "bar_description"
    t.string   "is_bar"
    t.string   "website"
    t.integer  "bar_size"
    t.float    "lat"
    t.float    "lng"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_foreign_key "events", "users"
  add_foreign_key "requests", "events"
  add_foreign_key "requests", "users"
end
