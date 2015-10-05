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

ActiveRecord::Schema.define(version: 20151005152854) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "address_users", id: false, force: :cascade do |t|
    t.integer  "address_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "addresses", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "streetAddress"
    t.string   "city"
    t.integer  "zipCode"
    t.string   "state"
    t.float    "long"
    t.float    "lat"
    t.boolean  "active"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "credit_cards", force: :cascade do |t|
    t.integer  "csv"
    t.string   "fname"
    t.string   "lname"
    t.integer  "expmonth"
    t.integer  "expyear"
    t.integer  "number"
    t.integer  "user_id"
    t.integer  "address_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "favor_users", id: false, force: :cascade do |t|
    t.integer  "favor_id"
    t.integer  "user_id"
    t.string   "role"
    t.text     "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "favors", force: :cascade do |t|
    t.string   "item"
    t.text     "description"
    t.float    "price"
    t.integer  "requestLive"
    t.integer  "address_id"
    t.boolean  "active",      default: true
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "password"
    t.string   "email"
    t.string   "fname"
    t.string   "lname"
    t.integer  "rank"
    t.integer  "phone"
    t.boolean  "active",     default: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "auth_token", default: ""
  end

  add_index "users", ["auth_token"], name: "index_users_on_auth_token", unique: true, using: :btree

end
