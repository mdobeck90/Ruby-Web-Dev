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

ActiveRecord::Schema.define(version: 20151212002948) do

  create_table "breaches", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "target_id"
    t.boolean  "breached"
    t.integer  "z_stolen"
    t.integer  "honeypot_stolen"
    t.integer  "firewall_stolen"
    t.integer  "o_contract_stolen"
    t.integer  "cash_stolen"
    t.boolean  "reward_collected",  default: false
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  create_table "jobs", force: :cascade do |t|
    t.string   "name"
    t.integer  "payout"
    t.string   "reward"
    t.integer  "difficulty"
    t.string   "description"
    t.integer  "time_to_complete"
    t.integer  "xp"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "operatives", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "status"
    t.integer  "skill"
    t.integer  "xp"
    t.integer  "job_id"
    t.time     "return_time"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "password"
    t.integer  "cash",              default: 10000
    t.integer  "zeroday",           default: 0
    t.integer  "o_contract",        default: 0
    t.integer  "honeypot",          default: 0
    t.integer  "firewall",          default: 0
    t.integer  "active_firewall",   default: 0
    t.integer  "active_honeypot",   default: 0
    t.integer  "active_o_contract", default: 0
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "password_digest"
  end

end
