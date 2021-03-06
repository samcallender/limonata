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

ActiveRecord::Schema.define(version: 20150331192934) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "buildings", force: :cascade do |t|
    t.integer  "building_id"
    t.string   "building_name"
    t.string   "city_name"
    t.integer  "image_width"
    t.integer  "image_height"
    t.integer  "drawing_id"
    t.integer  "city_id"
    t.integer  "state_id"
    t.string   "state_abbreviation"
    t.string   "country_name"
    t.integer  "status_id"
    t.string   "status"
    t.integer  "finished"
    t.integer  "floors"
    t.string   "building_use"
    t.float    "antenna_height"
    t.float    "spire_height"
    t.float    "roof_height"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",        null: false
    t.string   "name",            null: false
    t.string   "password_digest", null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
