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

ActiveRecord::Schema[7.0].define(version: 2023_11_02_165220) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "advertisement_tags", force: :cascade do |t|
    t.bigint "advertisement_id", null: false
    t.bigint "tag_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["advertisement_id", "tag_id"], name: "index_advertisement_tags_on_advertisement_id_and_tag_id", unique: true
    t.index ["advertisement_id"], name: "index_advertisement_tags_on_advertisement_id"
    t.index ["tag_id"], name: "index_advertisement_tags_on_tag_id"
  end

  create_table "advertisements", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_advertisements_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.text "body"
    t.bigint "advertisement_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["advertisement_id"], name: "index_comments_on_advertisement_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "full_name"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role", default: 0, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["role"], name: "index_users_on_role"
  end

  add_foreign_key "advertisement_tags", "advertisements"
  add_foreign_key "advertisement_tags", "tags"
  add_foreign_key "advertisements", "users"
  add_foreign_key "comments", "advertisements"
  add_foreign_key "comments", "users"
end
