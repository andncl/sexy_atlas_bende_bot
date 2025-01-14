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

ActiveRecord::Schema[7.0].define(version: 2023_01_15_132009) do
  create_table "cooks", force: :cascade do |t|
    t.string "first_name"
    t.integer "meal_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["meal_id"], name: "index_cooks_on_meal_id"
    t.index ["user_id"], name: "index_cooks_on_user_id"
  end

  create_table "eaters", force: :cascade do |t|
    t.string "first_name"
    t.integer "user_id", null: false
    t.integer "meal_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "cooking"
    t.boolean "eating"
    t.index ["meal_id"], name: "index_eaters_on_meal_id"
    t.index ["user_id"], name: "index_eaters_on_user_id"
  end

  create_table "meals", force: :cascade do |t|
    t.string "name"
    t.float "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "cook_id"
    t.integer "message_id"
    t.index ["cook_id"], name: "index_meals_on_cook_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.float "balance"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "cooks", "meals"
  add_foreign_key "eaters", "meals"
  add_foreign_key "eaters", "users"
end
