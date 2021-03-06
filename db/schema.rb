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

ActiveRecord::Schema.define(version: 20161125161206) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "ports", force: :cascade do |t|
    t.integer  "pin_id"
    t.string   "gpio"
    t.integer  "port_number"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "station_id"
  end

  create_table "program_rules", force: :cascade do |t|
    t.integer  "program_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "rule_id"
  end

  add_index "program_rules", ["program_id"], name: "index_program_rules_on_program_id", using: :btree
  add_index "program_rules", ["rule_id"], name: "index_program_rules_on_rule_id", using: :btree

  create_table "program_stations", force: :cascade do |t|
    t.integer  "program_id"
    t.integer  "station_id"
    t.integer  "sequence"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "duration"
  end

  add_index "program_stations", ["program_id"], name: "index_program_stations_on_program_id", using: :btree
  add_index "program_stations", ["station_id"], name: "index_program_stations_on_station_id", using: :btree

  create_table "programs", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "enabled",     default: true, null: false
    t.time     "start_time"
    t.datetime "last_run_on"
  end

  create_table "rules", force: :cascade do |t|
    t.string   "name"
    t.string   "group"
    t.boolean  "exclusive"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stations", force: :cascade do |t|
    t.integer  "sequence"
    t.integer  "duration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "number"
    t.string   "location"
  end

  add_foreign_key "ports", "stations"
  add_foreign_key "program_rules", "programs"
  add_foreign_key "program_rules", "rules"
  add_foreign_key "program_stations", "programs"
  add_foreign_key "program_stations", "stations"
end
