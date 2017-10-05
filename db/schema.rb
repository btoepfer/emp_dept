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

ActiveRecord::Schema.define(version: 20171004100006) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "departments", id: :serial, force: :cascade do |t|
    t.string "dname", limit: 14
    t.string "loc", limit: 13
    t.index ["dname"], name: "index_departments_on_dname", unique: true
  end

  create_table "employees", id: :serial, force: :cascade do |t|
    t.decimal "empno", precision: 5, null: false
    t.string "ename", limit: 10
    t.string "job", limit: 9
    t.decimal "mgr", precision: 4
    t.date "hiredate"
    t.decimal "sal", precision: 7, scale: 2
    t.decimal "comm", precision: 7, scale: 2
    t.integer "department_id", null: false
    t.index ["department_id"], name: "index_employees_on_department_id"
    t.index ["empno"], name: "index_employees_on_empno", unique: true
    t.index ["mgr"], name: "index_employees_on_mgr"
  end

  create_table "users", force: :cascade do |t|
    t.string "full_name", null: false
    t.string "nickname"
    t.string "email", null: false
    t.string "password_digest", default: "", null: false
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "role", default: "read-only", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "employees", "departments"
  add_foreign_key "employees", "employees", column: "mgr", primary_key: "empno"
end
