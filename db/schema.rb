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

ActiveRecord::Schema.define(version: 20170403092624) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attachinary_files", force: :cascade do |t|
    t.string   "attachinariable_type"
    t.integer  "attachinariable_id"
    t.string   "scope"
    t.string   "public_id"
    t.string   "version"
    t.integer  "width"
    t.integer  "height"
    t.string   "format"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["attachinariable_type", "attachinariable_id", "scope"], name: "by_scoped_parent", using: :btree
  end

  create_table "book_comunities", force: :cascade do |t|
    t.integer  "pupil_id"
    t.text     "about_me"
    t.string   "photo_from_last"
    t.string   "photo_form_today"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "books", force: :cascade do |t|
    t.integer  "pupil_id"
    t.string   "last_name"
    t.text     "about"
    t.boolean  "expose_phone", default: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["pupil_id"], name: "index_books_on_pupil_id", using: :btree
  end

  create_table "contacts", force: :cascade do |t|
    t.string   "full_name"
    t.string   "email"
    t.string   "phone_number"
    t.text     "body"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "homes", force: :cascade do |t|
    t.text     "what_plan"
    t.text     "who_orgenize"
    t.text     "what_help"
    t.text     "what_need"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.text     "email_registration"
  end

  create_table "memorials", force: :cascade do |t|
    t.integer  "book_id"
    t.integer  "pupil_id_sender"
    t.integer  "pupil_id_reciver"
    t.text     "content"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["book_id"], name: "index_memorials_on_book_id", using: :btree
    t.index ["pupil_id_reciver"], name: "index_memorials_on_pupil_id_reciver", using: :btree
    t.index ["pupil_id_sender"], name: "index_memorials_on_pupil_id_sender", using: :btree
  end

  create_table "not_in_lists", force: :cascade do |t|
    t.string   "full_name"
    t.string   "phone_number"
    t.string   "email"
    t.string   "class_name"
    t.boolean  "is_teacher"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "pupils", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "madien_name"
    t.string   "class_name"
    t.string   "email"
    t.string   "phone"
    t.boolean  "is_coming",     default: false
    t.boolean  "is_registered", default: false
    t.boolean  "is_teacher",    default: false
    t.boolean  "is_invited",    default: false
    t.integer  "invited_by"
    t.string   "invited_phone"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_foreign_key "books", "pupils"
  add_foreign_key "memorials", "books"
end
