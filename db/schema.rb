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

ActiveRecord::Schema.define(version: 20180812193604) do

  create_table "countries", force: :cascade do |t|
    t.string "code", limit: 5
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_countries_on_code", unique: true
  end

  create_table "country_tax_settings", force: :cascade do |t|
    t.integer "country_id"
    t.integer "currency_id"
    t.integer "start_month"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_country_tax_settings_on_country_id"
    t.index ["currency_id"], name: "index_country_tax_settings_on_currency_id"
  end

  create_table "currencies", force: :cascade do |t|
    t.string "symbol", limit: 1
    t.string "code", limit: 5
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_currencies_on_code", unique: true
    t.index ["symbol"], name: "index_currencies_on_symbol", unique: true
  end

  create_table "tax_year_details", force: :cascade do |t|
    t.integer "tax_year_id"
    t.decimal "marginal_rate"
    t.decimal "bracket_start"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tax_year_id"], name: "index_tax_year_details_on_tax_year_id"
  end

  create_table "tax_years", force: :cascade do |t|
    t.integer "country_id"
    t.integer "year"
    t.string "name"
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_tax_years_on_country_id"
  end

end
