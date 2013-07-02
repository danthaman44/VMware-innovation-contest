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

ActiveRecord::Schema.define(version: 20130701202428) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "idea_comments", force: true do |t|
    t.integer  "user_id",                   null: false
    t.integer  "idea_id",                   null: false
    t.text     "content",                   null: false
    t.boolean  "published",  default: true, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "idea_comments", ["idea_id"], name: "index_idea_comments_on_idea_id", using: :btree
  add_index "idea_comments", ["user_id"], name: "index_idea_comments_on_user_id", using: :btree

  create_table "idea_files", force: true do |t|
    t.integer  "idea_id",                   null: false
    t.integer  "user_id",                   null: false
    t.string   "file",                      null: false
    t.boolean  "published",  default: true, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "idea_files", ["file"], name: "index_idea_files_on_file", using: :btree
  add_index "idea_files", ["idea_id"], name: "index_idea_files_on_idea_id", using: :btree

  create_table "idea_likes", force: true do |t|
    t.integer  "user_id",    null: false
    t.integer  "idea_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ideas", force: true do |t|
    t.integer  "user_id",                    null: false
    t.string   "title",                      null: false
    t.text     "description",                null: false
    t.boolean  "published",   default: true, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ideas", ["title"], name: "index_ideas_on_title", using: :btree
  add_index "ideas", ["user_id"], name: "index_ideas_on_user_id", using: :btree

  create_table "page_items", force: true do |t|
    t.integer  "user_id",                   null: false
    t.string   "title",                     null: false
    t.text     "content"
    t.integer  "sort_order", default: 10,    null: false
    t.boolean  "published",  default: true, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "page_items", ["sort_order"], name: "index_page_items_on_sort_order", using: :btree
  add_index "page_items", ["title"], name: "index_page_items_on_title", using: :btree

  create_table "pages", force: true do |t|
    t.integer  "user_id",                   null: false
    t.string   "title",                     null: false
    t.text     "content"
    t.integer  "sort_order", default: 10,    null: false
    t.boolean  "published",  default: true, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pages", ["title"], name: "index_pages_on_title", using: :btree

  create_table "posts", force: true do |t|
    t.integer  "user_id",                   null: false
    t.string   "title",                     null: false
    t.text     "content",                   null: false
    t.boolean  "published",  default: true, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "posts", ["title"], name: "index_posts_on_title", using: :btree

  create_table "users", force: true do |t|
    t.string   "name",                                null: false
    t.string   "email",                               null: false
    t.string   "password",                            null: false
    t.string   "job_title"
    t.string   "phone"
    t.text     "technical_expertise"
    t.boolean  "email_idea_comments", default: true,  null: false
    t.boolean  "email_news",          default: true,  null: false
    t.boolean  "is_admin",            default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["job_title"], name: "index_users_on_job_title", using: :btree
  add_index "users", ["name"], name: "index_users_on_name", using: :btree
  add_index "users", ["technical_expertise"], name: "index_users_on_technical_expertise", using: :btree

end
