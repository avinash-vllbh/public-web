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

ActiveRecord::Schema.define(version: 20140824215947) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "adminpack"

  create_table "blogs", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
    t.text     "body"
    t.string   "keywords"
    t.integer  "comments",    default: 0, null: false
    t.integer  "category_id", default: 0, null: false
    t.string   "slug",                    null: false
  end

  add_index "blogs", ["category_id"], name: "index_blogs_on_category", using: :btree
  add_index "blogs", ["slug"], name: "index_blogs_on_slug", using: :btree

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
  end

  add_index "categories", ["slug"], name: "index_categories_on_slug", using: :btree

  create_table "comments", force: true do |t|
    t.integer  "blog_id"
    t.text     "body",       null: false
    t.string   "posted_by"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "comments", ["blog_id"], name: "index_comments_on_blog_id", using: :btree

  create_table "contacts", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.text     "message"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "palettes", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects", force: true do |t|
    t.string   "title"
    t.string   "description"
    t.string   "language"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug",        null: false
    t.string   "github"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin"
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
