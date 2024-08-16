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

ActiveRecord::Schema[7.2].define(version: 2024_08_16_000810) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "availabilities", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "service_id", null: false
    t.bigint "week_id", null: false
    t.time "start_time", null: false
    t.time "end_time", null: false
    t.boolean "available", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["service_id"], name: "index_availabilities_on_service_id"
    t.index ["user_id"], name: "index_availabilities_on_user_id"
    t.index ["week_id"], name: "index_availabilities_on_week_id"
  end

  create_table "change_logs", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "shift_id", null: false
    t.text "change_description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shift_id"], name: "index_change_logs_on_shift_id"
    t.index ["user_id"], name: "index_change_logs_on_user_id"
  end

  create_table "services", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.time "contract_start_time"
    t.time "contract_end_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shifts", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "service_id", null: false
    t.bigint "week_id", null: false
    t.time "start_time", null: false
    t.time "end_time", null: false
    t.string "status", default: "sin asignar", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "day"
    t.index ["service_id"], name: "index_shifts_on_service_id"
    t.index ["user_id"], name: "index_shifts_on_user_id"
    t.index ["week_id"], name: "index_shifts_on_week_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "role", default: "ingeniero", null: false
    t.string "color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "weeks", force: :cascade do |t|
    t.date "start_date", null: false
    t.date "end_date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "number"
  end

  add_foreign_key "availabilities", "services"
  add_foreign_key "availabilities", "users"
  add_foreign_key "availabilities", "weeks"
  add_foreign_key "change_logs", "shifts"
  add_foreign_key "change_logs", "users"
  add_foreign_key "shifts", "services"
  add_foreign_key "shifts", "users"
  add_foreign_key "shifts", "weeks"
end
