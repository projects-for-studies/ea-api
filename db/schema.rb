# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_08_22_215546) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "adresses", force: :cascade do |t|
    t.string "city"
    t.string "state"
    t.string "zip_code"
    t.string "street"
    t.string "district"
    t.string "number"
    t.string "complement"
    t.string "reference"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "auction_winners", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.bigint "auction_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["auction_id"], name: "index_auction_winners_on_auction_id"
    t.index ["product_id"], name: "index_auction_winners_on_product_id"
    t.index ["user_id"], name: "index_auction_winners_on_user_id"
  end

  create_table "auctions", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "status_auction_id", null: false
    t.datetime "start_date"
    t.datetime "final_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["status_auction_id"], name: "index_auctions_on_status_auction_id"
    t.index ["user_id"], name: "index_auctions_on_user_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.bigint "user_id", null: false
    t.text "photos"
    t.decimal "minimum_bid_amount"
    t.decimal "final_bid_amount"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_products_on_user_id"
  end

  create_table "products_by_auctions", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.bigint "auction_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["auction_id"], name: "index_products_by_auctions_on_auction_id"
    t.index ["product_id"], name: "index_products_by_auctions_on_product_id"
  end

  create_table "status_auctions", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.boolean "status"
    t.string "gender"
    t.date "date_birth"
    t.string "photo"
    t.string "telephone_1"
    t.string "telephone_2"
    t.bigint "adress_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["adress_id"], name: "index_users_on_adress_id"
  end

  add_foreign_key "auction_winners", "auctions"
  add_foreign_key "auction_winners", "products"
  add_foreign_key "auction_winners", "users"
  add_foreign_key "auctions", "status_auctions"
  add_foreign_key "auctions", "users"
  add_foreign_key "products", "users"
  add_foreign_key "products_by_auctions", "auctions"
  add_foreign_key "products_by_auctions", "products"
  add_foreign_key "users", "adresses"
end