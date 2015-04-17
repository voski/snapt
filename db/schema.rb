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

ActiveRecord::Schema.define(version: 20150417162001) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.integer  "author_id",  null: false
    t.integer  "photo_id",   null: false
    t.text     "content",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["author_id"], name: "index_comments_on_author_id", using: :btree
  add_index "comments", ["photo_id"], name: "index_comments_on_photo_id", using: :btree

  create_table "follows", force: :cascade do |t|
    t.integer  "followee_id", null: false
    t.integer  "follower_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "follows", ["followee_id", "follower_id"], name: "index_follows_on_followee_id_and_follower_id", unique: true, using: :btree
  add_index "follows", ["followee_id"], name: "index_follows_on_followee_id", using: :btree
  add_index "follows", ["follower_id"], name: "index_follows_on_follower_id", using: :btree

  create_table "likes", force: :cascade do |t|
    t.integer  "photo_id",   null: false
    t.integer  "liker_id",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "likes", ["liker_id"], name: "index_likes_on_liker_id", using: :btree
  add_index "likes", ["photo_id", "liker_id"], name: "index_likes_on_photo_id_and_liker_id", unique: true, using: :btree
  add_index "likes", ["photo_id"], name: "index_likes_on_photo_id", using: :btree

  create_table "photos", force: :cascade do |t|
    t.integer  "author_id",                     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "public_id",                     null: false
    t.text     "title",       default: "Title", null: false
    t.integer  "coordinates", default: [],                   array: true
    t.integer  "likes_count", default: 0
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",                        null: false
    t.string   "password_digest",                 null: false
    t.string   "session_token",                   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                           null: false
    t.boolean  "private",         default: false, null: false
    t.string   "profile_pic_pid"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["session_token"], name: "index_users_on_session_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
