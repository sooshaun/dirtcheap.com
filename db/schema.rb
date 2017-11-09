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

ActiveRecord::Schema.define(version: 20171107115707) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "conversations", force: :cascade do |t|
    t.bigint "user1_id"
    t.bigint "household_item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["household_item_id"], name: "index_conversations_on_household_item_id"
    t.index ["user1_id"], name: "index_conversations_on_user1_id"
  end

  create_table "household_items", force: :cascade do |t|
    t.integer "year_purchase"
    t.text "description"
    t.text "street_name"
    t.string "postcode"
    t.string "state"
    t.string "country"
    t.bigint "seller_id"
    t.bigint "buyer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "genre"
    t.string "title"
    t.text "item_image_data"
    t.string "city"
    t.decimal "transport_cost_cents"
    t.decimal "price_cents"
    t.decimal "latitude", precision: 10, scale: 6
    t.decimal "longitude", precision: 10, scale: 6
    t.index ["buyer_id"], name: "index_household_items_on_buyer_id"
    t.index ["seller_id"], name: "index_household_items_on_seller_id"
  end

  create_table "messages", force: :cascade do |t|
    t.bigint "conversation_id"
    t.bigint "sender_id"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["conversation_id"], name: "index_messages_on_conversation_id"
    t.index ["created_at"], name: "index_messages_on_created_at"
    t.index ["sender_id"], name: "index_messages_on_sender_id"
  end

  create_table "payments", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "household_item_id"
    t.string "charge_identifier"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["household_item_id"], name: "index_payments_on_household_item_id"
    t.index ["user_id"], name: "index_payments_on_user_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "bsb"
    t.string "account_number"
    t.boolean "privacy"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "mobile_number"
    t.text "avatar_data"
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.text "comment"
    t.integer "rating"
    t.bigint "user_id"
    t.bigint "household_item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["household_item_id"], name: "index_reviews_on_household_item_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "conversations", "household_items"
  add_foreign_key "conversations", "users", column: "user1_id"
  add_foreign_key "household_items", "users", column: "buyer_id"
  add_foreign_key "household_items", "users", column: "seller_id"
  add_foreign_key "messages", "conversations"
  add_foreign_key "messages", "users", column: "sender_id"
  add_foreign_key "payments", "household_items"
  add_foreign_key "payments", "users"
  add_foreign_key "profiles", "users"
  add_foreign_key "reviews", "household_items"
  add_foreign_key "reviews", "users"
end
