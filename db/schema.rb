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

ActiveRecord::Schema[7.0].define(version: 2023_05_25_151640) do
  create_table "accesses", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "route"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "parent_category_id"
    t.index ["parent_category_id"], name: "index_categories_on_parent_category_id"
  end

  create_table "members", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.bigint "team_id", null: false
    t.bigint "team_role_id", null: false
    t.index ["team_id"], name: "index_members_on_team_id"
    t.index ["team_role_id"], name: "index_members_on_team_role_id"
    t.index ["user_id"], name: "index_members_on_user_id"
  end

  create_table "role_accesses", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "role_id", null: false
    t.bigint "access_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["access_id"], name: "index_role_accesses_on_access_id"
    t.index ["role_id"], name: "index_role_accesses_on_role_id"
  end

  create_table "roles", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "type", null: false
    t.bigint "team_id"
    t.index ["team_id"], name: "index_roles_on_team_id"
  end

  create_table "teams", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "category_id", null: false
    t.index ["category_id"], name: "index_teams_on_category_id"
  end

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "email", null: false
    t.string "password_digest", null: false
    t.string "username", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.date "date_of_birth"
    t.integer "gender"
    t.bigint "role_id", null: false
    t.index ["role_id"], name: "index_users_on_role_id"
  end

  add_foreign_key "categories", "categories", column: "parent_category_id"
  add_foreign_key "members", "roles", column: "team_role_id"
  add_foreign_key "members", "teams"
  add_foreign_key "members", "users"
  add_foreign_key "role_accesses", "accesses"
  add_foreign_key "role_accesses", "roles"
  add_foreign_key "roles", "teams"
  add_foreign_key "teams", "categories"
  add_foreign_key "users", "roles"
end
