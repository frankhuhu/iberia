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

ActiveRecord::Schema.define(version: 20150105035712) do

  create_table "inventories", force: true do |t|
    t.string   "invoice"
    t.string   "customer"
    t.datetime "paid_date"
    t.string   "side"
    t.string   "o_f"
    t.string   "crt"
    t.string   "seal"
    t.string   "bale"
    t.integer  "weight"
    t.string   "bgk"
    t.datetime "erd",         limit: 255
    t.datetime "cutoff_date"
    t.text     "note"
    t.datetime "in_date"
    t.datetime "out_date"
    t.string   "bl"
    t.string   "pic"
    t.string   "truck"
    t.string   "paid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
