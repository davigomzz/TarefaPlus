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

ActiveRecord::Schema[7.1].define(version: 2025_02_10_212622) do
  create_table "classrooms", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "classrooms_teachers", force: :cascade do |t|
    t.integer "classroom_id", null: false
    t.integer "teacher_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["classroom_id"], name: "index_classrooms_teachers_on_classroom_id"
    t.index ["teacher_id"], name: "index_classrooms_teachers_on_teacher_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.date "due_date"
    t.integer "status"
    t.integer "teacher_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "classroom_id"
    t.index ["classroom_id"], name: "index_tasks_on_classroom_id"
    t.index ["teacher_id"], name: "index_tasks_on_teacher_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "role"
    t.integer "classroom_id"
    t.index ["classroom_id"], name: "index_users_on_classroom_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "classrooms_teachers", "classrooms"
  add_foreign_key "classrooms_teachers", "users", column: "teacher_id"
  add_foreign_key "tasks", "classrooms"
  add_foreign_key "tasks", "users", column: "teacher_id"
  add_foreign_key "users", "classrooms"
end
