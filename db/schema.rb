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

ActiveRecord::Schema.define(version: 2019_10_28_100939) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assigned_works", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "shift_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "assigned_time", null: false
    t.index ["shift_id"], name: "index_assigned_works_on_shift_id"
    t.index ["user_id"], name: "index_assigned_works_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "shift_id", null: false
    t.text "content", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shift_id"], name: "index_comments_on_shift_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "request_shifts", force: :cascade do |t|
    t.date "worked_on", null: false
    t.time "start_work_at", null: false
    t.string "work_job", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.time "end_work_at", null: false
    t.index ["user_id"], name: "index_request_shifts_on_user_id"
  end

  create_table "shifts", force: :cascade do |t|
    t.date "duty_on", null: false
    t.time "started_at", null: false
    t.string "job", null: false
    t.string "assigned_user"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.time "end_at", null: false
    t.integer "status", limit: 2, default: 1, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "number", null: false
    t.boolean "admin", default: false, null: false
    t.string "name", null: false
    t.integer "assigned_time"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "assigned_works", "shifts"
  add_foreign_key "assigned_works", "users"
  add_foreign_key "comments", "shifts"
  add_foreign_key "comments", "users"
  add_foreign_key "request_shifts", "users"
end
