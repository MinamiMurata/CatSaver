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

ActiveRecord::Schema.define(version: 2023_07_20_125513) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "blogs", force: :cascade do |t|
    t.string "title", null: false
    t.text "content", null: false
    t.text "image"
    t.string "disease_name"
    t.integer "age_range", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.bigint "cat_id"
    t.index ["cat_id"], name: "index_blogs_on_cat_id"
    t.index ["user_id"], name: "index_blogs_on_user_id"
  end

  create_table "breeds", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "cats", force: :cascade do |t|
    t.string "name", null: false
    t.text "introduction"
    t.text "image"
    t.date "birthday"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "breed_id", null: false
    t.bigint "user_id", null: false
    t.index ["breed_id"], name: "index_cats_on_breed_id"
    t.index ["user_id"], name: "index_cats_on_user_id"
  end

  create_table "symptoms", force: :cascade do |t|
    t.integer "category"
    t.string "detail"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "taggings", force: :cascade do |t|
    t.bigint "blog_id", null: false
    t.bigint "symptom_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["blog_id"], name: "index_taggings_on_blog_id"
    t.index ["symptom_id"], name: "index_taggings_on_symptom_id"
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
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name", null: false
    t.text "introduction"
    t.text "image"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "blogs", "cats"
  add_foreign_key "blogs", "users"
  add_foreign_key "cats", "breeds"
  add_foreign_key "cats", "users"
  add_foreign_key "taggings", "blogs"
  add_foreign_key "taggings", "symptoms"
end
