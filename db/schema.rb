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

ActiveRecord::Schema.define(version: 20170321093937) do

  create_table "countries", force: :cascade do |t|
    t.string   "code",       limit: 2, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "countries", ["code"], name: "index_countries_on_code", unique: true, using: :btree

  create_table "currencies", force: :cascade do |t|
    t.string   "code",       limit: 3, null: false
    t.string   "symbol",     limit: 3, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "currencies", ["code"], name: "index_currencies_on_code", unique: true, using: :btree

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   limit: 4,     default: 0, null: false
    t.integer  "attempts",   limit: 4,     default: 0, null: false
    t.text     "handler",    limit: 65535,             null: false
    t.text     "last_error", limit: 65535
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by",  limit: 255
    t.string   "queue",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "event_attribute_groups", force: :cascade do |t|
    t.string   "name",        limit: 255, null: false
    t.string   "description", limit: 255
    t.string   "account",     limit: 255, null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "event_type_attributes", force: :cascade do |t|
    t.string   "name",           limit: 255, null: false
    t.string   "description",    limit: 255
    t.integer  "event_type_id",  limit: 4,   null: false
    t.string   "attribute_type", limit: 255, null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "event_type_attributes", ["event_type_id"], name: "fk_rails_7280bfba4a", using: :btree

  create_table "event_types", force: :cascade do |t|
    t.string   "name",             limit: 255,                     null: false
    t.string   "description",      limit: 255
    t.string   "account",          limit: 255,                     null: false
    t.string   "format",           limit: 255,                     null: false
    t.string   "transaction_type", limit: 255, default: "support", null: false
    t.boolean  "strict_format",                default: false,     null: false
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
  end

  add_index "event_types", ["name", "account"], name: "index_event_types_on_name_and_account", using: :btree

  create_table "languages", force: :cascade do |t|
    t.string   "code",       limit: 2, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "languages", ["code"], name: "index_languages_on_code", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                           limit: 255,                 null: false
    t.string   "encrypted_password",              limit: 128,                 null: false
    t.string   "full_name",                       limit: 255,                 null: false
    t.string   "email_confirmation_token",        limit: 128
    t.datetime "email_confirmation_requested_at"
    t.datetime "email_confirmed_at"
    t.string   "password_change_token",           limit: 128
    t.datetime "password_change_requested_at"
    t.datetime "password_changed_at"
    t.string   "gender",                          limit: 255
    t.datetime "birth_date"
    t.string   "time_zone",                       limit: 255, default: "UTC", null: false
    t.boolean  "receive_email_notifications",                 default: false
    t.datetime "created_at",                                                  null: false
    t.datetime "updated_at",                                                  null: false
    t.integer  "country_id",                      limit: 4
    t.integer  "currency_id",                     limit: 4
    t.integer  "language_id",                     limit: 4
  end

  add_index "users", ["country_id"], name: "fk_rails_7325e2cdfa", using: :btree
  add_index "users", ["currency_id"], name: "fk_rails_2bba9074ed", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["language_id"], name: "fk_rails_45f4f12508", using: :btree

  add_foreign_key "event_type_attributes", "event_types"
  add_foreign_key "users", "countries"
  add_foreign_key "users", "currencies"
  add_foreign_key "users", "languages"
end
