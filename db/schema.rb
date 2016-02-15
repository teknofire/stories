# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160214104545) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authorizations", force: :cascade do |t|
    t.string   "provider"
    t.string   "uid"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "authorizations", ["user_id"], name: "index_authorizations_on_user_id", using: :btree

  create_table "books", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "user_id"
    t.string   "slug"
    t.boolean  "public",      default: false
  end

  add_index "books", ["user_id"], name: "index_books_on_user_id", using: :btree

  create_table "chapters", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "sequence"
    t.integer  "book_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "story_id"
    t.string   "story_filename"
    t.integer  "story_size"
    t.string   "story_content_type"
    t.integer  "upload_id"
    t.integer  "position"
    t.string   "slug"
  end

  add_index "chapters", ["book_id"], name: "index_chapters_on_book_id", using: :btree
  add_index "chapters", ["upload_id"], name: "index_chapters_on_upload_id", using: :btree

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "pages", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "sequence"
    t.string   "image_id"
    t.string   "image_filename"
    t.integer  "image_size"
    t.string   "image_content_type"
    t.integer  "chapter_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.boolean  "seen"
  end

  add_index "pages", ["chapter_id"], name: "index_pages_on_chapter_id", using: :btree

  create_table "themes", force: :cascade do |t|
    t.string   "title"
    t.string   "background"
    t.string   "navbar"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "navbar_font_color"
    t.string   "panel_color"
    t.boolean  "site"
  end

  create_table "uploads", force: :cascade do |t|
    t.string   "file_id"
    t.integer  "file_size"
    t.string   "file_filename"
    t.string   "file_content_type"
    t.integer  "book_id"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.string   "status",            default: "queued"
    t.integer  "user_id"
  end

  add_index "uploads", ["book_id"], name: "index_uploads_on_book_id", using: :btree
  add_index "uploads", ["user_id"], name: "index_uploads_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "avatar"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "admin",      default: false
    t.boolean  "authorized"
  end

  add_foreign_key "authorizations", "users"
  add_foreign_key "books", "users"
  add_foreign_key "chapters", "books"
  add_foreign_key "chapters", "uploads"
  add_foreign_key "pages", "chapters"
  add_foreign_key "uploads", "books"
  add_foreign_key "uploads", "users"
end
