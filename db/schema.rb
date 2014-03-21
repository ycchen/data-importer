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

ActiveRecord::Schema.define(version: 20140321142805) do

  create_table "import_details", force: true do |t|
    t.string   "purchaser_name"
    t.string   "merchant_name"
    t.string   "merchant_address"
    t.string   "item_description"
    t.decimal  "item_price"
    t.integer  "purchase_count",   default: 0
    t.integer  "import_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "import_details", ["import_id"], name: "index_import_details_on_import_id"

  create_table "imports", force: true do |t|
    t.integer  "record_count"
    t.decimal  "total_gross_revenue"
    t.boolean  "completed"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "items", force: true do |t|
    t.string   "description"
    t.decimal  "price",       precision: 8, scale: 2, default: 0.0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "merchants", force: true do |t|
    t.string   "name"
    t.string   "address"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "purchasers", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sales", force: true do |t|
    t.integer  "purchaser_id"
    t.integer  "item_id"
    t.integer  "merchant_id"
    t.integer  "unit"
    t.decimal  "item_cost",    precision: 8, scale: 2, default: 0.0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sales", ["item_id"], name: "index_sales_on_item_id"
  add_index "sales", ["merchant_id"], name: "index_sales_on_merchant_id"
  add_index "sales", ["purchaser_id"], name: "index_sales_on_purchaser_id"

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
