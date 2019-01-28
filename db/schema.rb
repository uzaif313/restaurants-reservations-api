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

ActiveRecord::Schema.define(version: 2019_01_28_090824) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "audit_logs", force: :cascade do |t|
    t.json "log"
    t.string "audit_logable_type"
    t.bigint "audit_logable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["audit_logable_type", "audit_logable_id"], name: "index_audit_logs_on_audit_logable_type_and_audit_logable_id"
  end

  create_table "guests", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reservations", force: :cascade do |t|
    t.bigint "restaurant_table_id"
    t.bigint "restaurant_shift_id"
    t.datetime "reservation_time"
    t.bigint "guest_id"
    t.integer "guest_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["guest_id"], name: "index_reservations_on_guest_id"
    t.index ["restaurant_shift_id"], name: "index_reservations_on_restaurant_shift_id"
    t.index ["restaurant_table_id"], name: "index_reservations_on_restaurant_table_id"
  end

  create_table "restaurant_shifts", force: :cascade do |t|
    t.bigint "restaurant_id"
    t.string "shift_name"
    t.time "start_at"
    t.time "end_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["restaurant_id"], name: "index_restaurant_shifts_on_restaurant_id"
  end

  create_table "restaurant_tables", force: :cascade do |t|
    t.bigint "restaurant_id"
    t.string "table_name"
    t.integer "min_guests"
    t.integer "max_guests"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["restaurant_id"], name: "index_restaurant_tables_on_restaurant_id"
  end

  create_table "restaurants", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tables", force: :cascade do |t|
    t.bigint "restaurant_id"
    t.string "table_name"
    t.integer "min_guests"
    t.integer "max_guests"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["restaurant_id"], name: "index_tables_on_restaurant_id"
  end

  add_foreign_key "reservations", "guests"
  add_foreign_key "reservations", "restaurant_shifts"
  add_foreign_key "reservations", "restaurant_tables"
  add_foreign_key "restaurant_shifts", "restaurants"
  add_foreign_key "restaurant_tables", "restaurants"
  add_foreign_key "tables", "restaurants"
end
