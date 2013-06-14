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

ActiveRecord::Schema.define(version: 20130614203837) do

  create_table "attachments", force: true do |t|
    t.string   "file_name"
    t.text     "location"
    t.integer  "file_size"
    t.integer  "idea_id"
    t.boolean  "published"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", force: true do |t|
    t.text     "body"
    t.integer  "user_id"
    t.integer  "idea_id"
    t.boolean  "published"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ideas", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "user_id"
    t.boolean  "published"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "likes", force: true do |t|
    t.integer  "user_id"
    t.integer  "idea_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "page_items", force: true do |t|
    t.integer  "order"
    t.text     "content"
    t.boolean  "published"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pages", force: true do |t|
    t.string   "name"
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", force: true do |t|
    t.string   "name"
    t.text     "content"
    t.boolean  "published"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password"
    t.string   "job_title"
    t.integer  "phone"
    t.string   "expertise"
    t.boolean  "email_notification_comment"
    t.boolean  "email_notification_news"
    t.boolean  "is_admin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
