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

ActiveRecord::Schema.define(version: 20160615141115) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: :cascade do |t|
    t.string   "caption"
    t.text     "content"
    t.integer  "client_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "caption_photo"
  end

  add_index "articles", ["client_id"], name: "index_articles_on_client_id", using: :btree

  create_table "clients", force: :cascade do |t|
    t.string   "email",                  default: "",       null: false
    t.string   "encrypted_password",     default: "",       null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,        null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.boolean  "admin",                  default: false
    t.string   "location"
    t.string   "phone_number"
    t.string   "tag",                    default: "online"
    t.integer  "requests_count"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "referral_code"
    t.string   "referrer_code"
    t.integer  "points",                 default: 0
    t.boolean  "subscribe",              default: false
  end

  add_index "clients", ["email"], name: "index_clients_on_email", unique: true, using: :btree
  add_index "clients", ["reset_password_token"], name: "index_clients_on_reset_password_token", unique: true, using: :btree

  create_table "comments", force: :cascade do |t|
    t.text     "content"
    t.integer  "client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "comments", ["client_id"], name: "index_comments_on_client_id", using: :btree

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "invoices", force: :cascade do |t|
    t.integer  "request_id"
    t.datetime "created_at",                                           null: false
    t.datetime "updated_at",                                           null: false
    t.string   "invoice_to"
    t.string   "invoice_from"
    t.datetime "due_date"
    t.datetime "date_issue"
    t.decimal  "due_balance",     precision: 6, scale: 2
    t.decimal  "amount_paid",     precision: 6, scale: 2
    t.integer  "rooms"
    t.decimal  "extra_services",                          default: [],              array: true
    t.decimal  "package",         precision: 6, scale: 2
    t.decimal  "total_amount",    precision: 6, scale: 2
    t.string   "recipient_email"
  end

  add_index "invoices", ["request_id"], name: "index_invoices_on_request_id", using: :btree

  create_table "orders", force: :cascade do |t|
    t.integer  "bedrooms"
    t.integer  "bathrooms"
    t.string   "email"
    t.string   "phone_number"
    t.text     "location"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.boolean  "terms",        default: false
  end

  create_table "referrals", force: :cascade do |t|
    t.integer  "sender_id"
    t.integer  "recipient_id"
    t.string   "code"
    t.string   "email"
    t.integer  "client_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "referrals", ["client_id"], name: "index_referrals_on_client_id", using: :btree

  create_table "reports", force: :cascade do |t|
    t.integer  "worker_id"
    t.integer  "client_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.datetime "date"
    t.text     "event"
    t.boolean  "sign",       default: false
  end

  add_index "reports", ["client_id"], name: "index_reports_on_client_id", using: :btree
  add_index "reports", ["worker_id"], name: "index_reports_on_worker_id", using: :btree

  create_table "requests", force: :cascade do |t|
    t.datetime "created_at",                                                         null: false
    t.datetime "updated_at",                                                         null: false
    t.integer  "client_id"
    t.boolean  "resolved",                                    default: false
    t.integer  "bedrooms",                                    default: 0
    t.integer  "bathrooms",                                   default: 0
    t.integer  "kitchens",                                    default: 0
    t.integer  "hall",                                        default: 0
    t.string   "weekdays",                                    default: [],                        array: true
    t.string   "extra_services",                              default: [],                        array: true
    t.string   "status",                                      default: "unresolved"
    t.string   "email"
    t.string   "phone_number"
    t.text     "location"
    t.decimal  "frequency",          precision: 6,  scale: 2
    t.boolean  "terms",                                       default: false
    t.decimal  "total_cost",         precision: 10, scale: 2
    t.integer  "total_rooms"
    t.decimal  "extra_services_sum", precision: 10, scale: 2
    t.string   "ref_code"
    t.string   "promocode"
    t.string   "date"
    t.datetime "time"
  end

  add_index "requests", ["client_id"], name: "index_requests_on_client_id", using: :btree

  create_table "requests_workers", id: false, force: :cascade do |t|
    t.integer "request_id"
    t.integer "worker_id"
  end

  add_index "requests_workers", ["request_id"], name: "index_requests_workers_on_request_id", using: :btree
  add_index "requests_workers", ["worker_id"], name: "index_requests_workers_on_worker_id", using: :btree

  create_table "reviews", force: :cascade do |t|
    t.integer  "worker_id"
    t.integer  "client_id"
    t.text     "comment"
    t.integer  "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "reviews", ["client_id"], name: "index_reviews_on_client_id", using: :btree
  add_index "reviews", ["worker_id"], name: "index_reviews_on_worker_id", using: :btree

  create_table "workers", force: :cascade do |t|
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "sex"
    t.integer  "age"
    t.string   "phone_number"
    t.string   "education"
    t.string   "location"
    t.text     "experience"
    t.integer  "minimum_wage"
    t.string   "email"
    t.text     "extra_info"
    t.boolean  "assigned",     default: false
    t.string   "attachment"
    t.string   "photo"
    t.string   "status",       default: "not verified"
  end

  add_foreign_key "articles", "clients"
  add_foreign_key "comments", "clients"
  add_foreign_key "referrals", "clients"
  add_foreign_key "reports", "clients"
  add_foreign_key "reports", "workers"
  add_foreign_key "requests", "clients"
  add_foreign_key "reviews", "clients"
  add_foreign_key "reviews", "workers"
end
