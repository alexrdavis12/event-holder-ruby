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

ActiveRecord::Schema.define(version: 20151203020326) do

  create_table "answers", force: :cascade do |t|
    t.integer  "eid"
    t.integer  "uid"
    t.integer  "qid"
    t.string   "answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "qtitle"
  end

  create_table "events", force: :cascade do |t|
    t.integer  "eid"
    t.string   "etitle"
    t.string   "elocation"
    t.date     "estart"
    t.date     "eend"
    t.text     "edescription"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "questions", force: :cascade do |t|
    t.integer  "qid"
    t.integer  "eid"
    t.text     "qtitle"
    t.string   "qtype"
    t.string   "qoption"
    t.integer  "qparentid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "parentopt"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "lastname"
    t.string   "firstname"
    t.string   "gender"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "salt"
    t.string   "encrypted_password"
    t.integer  "level"
    t.string   "zipcode"
  end

end
