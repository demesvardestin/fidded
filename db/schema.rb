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

ActiveRecord::Schema.define(version: 20200121024404) do

  create_table "ahoy_events", force: :cascade do |t|
    t.integer  "visit_id"
    t.integer  "user_id"
    t.string   "name"
    t.text     "properties"
    t.datetime "time"
    t.index ["name", "time"], name: "index_ahoy_events_on_name_and_time"
    t.index ["user_id"], name: "index_ahoy_events_on_user_id"
    t.index ["visit_id"], name: "index_ahoy_events_on_visit_id"
  end

  create_table "ahoy_visits", force: :cascade do |t|
    t.string   "visit_token"
    t.string   "visitor_token"
    t.integer  "user_id"
    t.string   "ip"
    t.text     "user_agent"
    t.text     "referrer"
    t.string   "referring_domain"
    t.text     "landing_page"
    t.string   "browser"
    t.string   "os"
    t.string   "device_type"
    t.string   "country"
    t.string   "region"
    t.string   "city"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "utm_source"
    t.string   "utm_medium"
    t.string   "utm_term"
    t.string   "utm_content"
    t.string   "utm_campaign"
    t.string   "app_version"
    t.string   "os_version"
    t.string   "platform"
    t.datetime "started_at"
    t.index ["user_id"], name: "index_ahoy_visits_on_user_id"
    t.index ["visit_token"], name: "index_ahoy_visits_on_visit_token", unique: true
  end

  create_table "bids", force: :cascade do |t|
    t.integer  "item_request_id"
    t.boolean  "accepted",         default: false
    t.integer  "partner_id"
    t.string   "images",           default: ""
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "item_size",        default: ""
    t.string   "item_brand",       default: ""
    t.string   "item_description", default: ""
    t.string   "item_condition",   default: ""
    t.string   "men_or_women",     default: ""
    t.string   "counter_offer"
    t.string   "waist"
    t.string   "length"
    t.string   "item_name"
    t.boolean  "declined"
    t.string   "decline_reason"
    t.string   "confirmation"
  end

  create_table "conversations", force: :cascade do |t|
    t.integer  "customer_id"
    t.integer  "partner_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email",                  default: "",    null: false
    t.string   "street_address"
    t.string   "town"
    t.string   "state"
    t.string   "zipcode"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string   "image"
    t.string   "twitter"
    t.string   "instagram"
    t.string   "facebook"
    t.string   "pinterest"
    t.boolean  "verified",               default: false
    t.string   "verified_via",           default: ""
    t.index ["email"], name: "index_customers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_customers_on_reset_password_token", unique: true
  end

  create_table "delivery_verifications", force: :cascade do |t|
    t.boolean  "as_expected"
    t.integer  "satisfaction_level"
    t.integer  "bid_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "favorites", force: :cascade do |t|
    t.integer  "item_request_id"
    t.integer  "partner_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "fit_pics", force: :cascade do |t|
    t.text     "url"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "customer_id"
  end

  create_table "flags", force: :cascade do |t|
    t.integer  "item_request_id"
    t.string   "flagger_type"
    t.integer  "flagger_id"
    t.string   "reason"
    t.text     "details"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "item_requests", force: :cascade do |t|
    t.integer  "fit_pic_id"
    t.string   "item_name"
    t.text     "item_description"
    t.string   "item_size"
    t.string   "item_brand"
    t.string   "price_offer"
    t.boolean  "claimed",          default: false
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "category",         default: ""
    t.string   "uid",              default: ""
    t.integer  "ahoy_visit_id"
    t.string   "men_or_women",     default: ""
    t.string   "waist"
    t.string   "length"
    t.boolean  "listed",           default: false
    t.boolean  "negotiable",       default: false
    t.boolean  "completed",        default: false
  end

  create_table "messages", force: :cascade do |t|
    t.integer  "sender_id"
    t.string   "sender_type"
    t.integer  "conversation_id"
    t.text     "body",             default: ""
    t.boolean  "read",             default: false
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.boolean  "read_by_customer", default: false
    t.boolean  "read_by_partner",  default: false
  end

  create_table "notifications", force: :cascade do |t|
    t.text     "message"
    t.integer  "recipient_id"
    t.string   "recipient_type"
    t.boolean  "read",           default: false
    t.integer  "bid_id"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "partners", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "street_address"
    t.string   "town"
    t.string   "state"
    t.string   "zipcode"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string   "image"
    t.string   "twitter"
    t.string   "instagram"
    t.string   "facebook"
    t.string   "pinterest"
    t.boolean  "verified",               default: false
    t.string   "verified_via",           default: ""
    t.string   "preferred_shipper"
    t.index ["email"], name: "index_partners_on_email", unique: true
    t.index ["reset_password_token"], name: "index_partners_on_reset_password_token", unique: true
  end

end
