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

ActiveRecord::Schema[7.0].define(version: 2023_01_22_000802) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authors", force: :cascade do |t|
    t.string "name", null: false, comment: "Author name"
    t.string "site", comment: "Site of author"
    t.string "email", comment: "E-mail of author"
    t.datetime "last_access", precision: nil, comment: "Last accessed time"
    t.text "profile", comment: "Description of author"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", comment: "Fk to user table"
  end

  create_table "posts", force: :cascade do |t|
    t.string "title", null: false, comment: "Title of post"
    t.text "content", null: false, comment: "Post content"
    t.boolean "visible", default: true, null: false, comment: "Flag of a post is visible for others users"
    t.integer "author_id", null: false, comment: "FK to authors table"
    t.integer "tag_id", null: false, comment: "FK to tags table"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "readers", force: :cascade do |t|
    t.string "name", null: false, comment: "Reader name"
    t.datetime "last_access", precision: nil, comment: "Last accessed time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string "name", null: false, comment: "Tag name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_admin", comment: "Flag if a user is system Admin"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
