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

ActiveRecord::Schema.define(version: 2021_02_28_033404) do

  create_table "comments", force: :cascade do |t|
    t.text "content"
    t.integer "user_id", null: false
    t.integer "inventory_list_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["inventory_list_id"], name: "index_comments_on_inventory_list_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "inventory_lists", force: :cascade do |t|
    t.string "name"
    t.integer "item_count"
    t.string "date"
    t.string "time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "list_content"
    t.integer "user_id"
    t.index ["user_id"], name: "index_inventory_lists_on_user_id"
  end

  create_table "items", force: :cascade do |t|
    t.integer "user_id"
    t.integer "list_id"
    t.string "name"
    t.integer "quantity"
    t.string "category"
    t.string "location"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "uid"
    t.string "image"
    t.string "provider"
  end

  add_foreign_key "comments", "inventory_lists", on_delete: :cascade
  add_foreign_key "comments", "users"
  add_foreign_key "inventory_lists", "users"
end
