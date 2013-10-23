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

ActiveRecord::Schema.define(version: 20131022224727) do

  create_table "achievements", force: true do |t|
    t.string   "name",       limit: 30,  null: false
    t.string   "dscription", limit: 500, null: false
    t.integer  "condition",              null: false
    t.string   "badge",      limit: 300
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "athreads", force: true do |t|
    t.integer  "user_id"
    t.string   "title",      limit: 200,                                 null: false
    t.string   "body",       limit: 500,                                 null: false
    t.boolean  "is_closed",              default: false
    t.integer  "no_flags",               default: 0
    t.integer  "views",                  default: 0
    t.datetime "Date",                   default: '2013-10-20 12:17:31'
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", force: true do |t|
    t.integer  "user_id"
    t.integer  "athread_id"
    t.string   "body",       limit: 500,                                 null: false
    t.integer  "no_flags",               default: 0
    t.integer  "views",                  default: 0
    t.datetime "date",                   default: '2013-10-20 12:17:29'
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "draft_threads", force: true do |t|
    t.integer  "user_id"
    t.string   "title",      limit: 200
    t.string   "body",       limit: 500
    t.datetime "saved_at",               default: '2013-10-20 12:17:29'
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "flags", force: true do |t|
    t.integer  "user_id"
    t.integer  "apost_id"
    t.string   "apost_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "follow_threads", force: true do |t|
    t.integer  "user_id"
    t.integer  "athread_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "follow_users", force: true do |t|
    t.integer  "user_id"
    t.integer  "second_user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "likes", force: true do |t|
    t.integer  "user_id"
    t.integer  "apost_id"
    t.string   "apost_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "moderators", force: true do |t|
    t.integer  "user_id"
    t.date     "moderator_since", default: '2013-10-20'
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", force: true do |t|
    t.integer  "athread_id"
    t.integer  "comment_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tags", force: true do |t|
    t.string   "name",       limit: 16
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "thread_tags", force: true do |t|
    t.integer  "athread_id"
    t.integer  "tag_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "threads", force: true do |t|
    t.string   "title",      limit: 200
    t.string   "body",       limit: 500
    t.boolean  "is_closed",              default: false
    t.integer  "no_flags",               default: 0
    t.integer  "views",                  default: 0
    t.datetime "Date",                   default: '2013-10-17 10:20:55'
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_achievements", force: true do |t|
    t.integer  "user_id"
    t.integer  "achievement_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "username",     limit: 16
    t.string   "password",     limit: 16
    t.string   "email",        limit: 40
    t.boolean  "is_staff",                default: false
    t.integer  "xp",                      default: 0
    t.boolean  "is_banned",               default: false
    t.date     "member_since"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
