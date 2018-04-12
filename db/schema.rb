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

ActiveRecord::Schema.define(version: 20180412020945) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bank_accounts", force: :cascade do |t|
    t.bigint "character_id"
    t.integer "balance", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_id"], name: "index_bank_accounts_on_character_id"
  end

  create_table "bank_transactions", force: :cascade do |t|
    t.bigint "bank_account_id"
    t.string "transaction_type", null: false
    t.integer "transaction_amount", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "target_account_id"
    t.index ["bank_account_id"], name: "index_bank_transactions_on_bank_account_id"
    t.index ["target_account_id"], name: "index_bank_transactions_on_target_account_id"
  end

  create_table "bookings", id: :serial, force: :cascade do |t|
    t.integer "character_id"
    t.integer "event_id", null: false
    t.integer "receipt_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id", "user_id"], name: "index_bookings_on_event_id_and_user_id", unique: true
  end

  create_table "character_profession_links", id: :serial, force: :cascade do |t|
    t.integer "character_id", null: false
    t.integer "link_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_id", "link_id"], name: "index_character_profession_links_on_character_id_and_link_id", unique: true
  end

  create_table "character_professions", id: :serial, force: :cascade do |t|
    t.integer "character_id", null: false
    t.integer "profession_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_id", "profession_id"], name: "index_character_professions_on_character_id_and_profession_id", unique: true
  end

  create_table "character_recipes", force: :cascade do |t|
    t.bigint "character_id"
    t.bigint "recipe_id"
    t.index ["character_id", "recipe_id"], name: "index_character_recipes_on_character_id_and_recipe_id", unique: true
    t.index ["character_id"], name: "index_character_recipes_on_character_id"
    t.index ["recipe_id"], name: "index_character_recipes_on_recipe_id"
  end

  create_table "characters", id: :serial, force: :cascade do |t|
    t.string "name", null: false
    t.text "history", default: ""
    t.integer "race", default: 0
    t.string "slug", null: false
    t.integer "user_id", null: false
    t.boolean "archived", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "drake"
    t.index ["slug"], name: "index_characters_on_slug", unique: true
    t.index ["user_id"], name: "index_characters_on_user_id"
  end

  create_table "entities", force: :cascade do |t|
    t.string "name", null: false
    t.text "description", null: false
    t.string "slug", null: false
    t.index ["name"], name: "index_entities_on_name", unique: true
    t.index ["slug"], name: "index_entities_on_slug", unique: true
  end

  create_table "entity_characters", force: :cascade do |t|
    t.bigint "entity_id"
    t.bigint "character_id"
    t.index ["character_id"], name: "index_entity_characters_on_character_id"
    t.index ["entity_id", "character_id"], name: "index_entity_characters_on_entity_id_and_character_id", unique: true
    t.index ["entity_id"], name: "index_entity_characters_on_entity_id"
  end

  create_table "entity_stores", force: :cascade do |t|
    t.bigint "entity_id"
    t.string "storable_type"
    t.bigint "storable_id"
    t.integer "quantity"
    t.index ["entity_id", "storable_id", "storable_type"], name: "store_item", unique: true
    t.index ["entity_id"], name: "index_entity_stores_on_entity_id"
    t.index ["storable_type", "storable_id"], name: "index_entity_stores_on_storable_type_and_storable_id"
  end

  create_table "events", id: :serial, force: :cascade do |t|
    t.string "address"
    t.text "directions"
    t.datetime "end_date", null: false
    t.float "latitude"
    t.float "longitude"
    t.string "name", null: false
    t.string "slug", null: false
    t.datetime "start_date", null: false
    t.boolean "visible", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_events_on_slug", unique: true
  end

  create_table "ingredient_professions", id: :serial, force: :cascade do |t|
    t.integer "ingredient_id"
    t.integer "profession_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ingredient_id", "profession_id"], name: "index_ingredient_professions_on_ingredient_id_and_profession_id", unique: true
    t.index ["ingredient_id"], name: "index_ingredient_professions_on_ingredient_id"
    t.index ["profession_id"], name: "index_ingredient_professions_on_profession_id"
  end

  create_table "ingredient_seasons", id: :serial, force: :cascade do |t|
    t.integer "ingredient_id"
    t.integer "season_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ingredient_id", "season_id"], name: "index_ingredient_seasons_on_ingredient_id_and_season_id", unique: true
    t.index ["ingredient_id"], name: "index_ingredient_seasons_on_ingredient_id"
    t.index ["season_id"], name: "index_ingredient_seasons_on_season_id"
  end

  create_table "ingredients", id: :serial, force: :cascade do |t|
    t.string "name", null: false
    t.text "staff_notes"
    t.integer "grade"
    t.integer "category", default: 0, null: false
    t.integer "rarity", default: 0, null: false
    t.string "process_calcination"
    t.string "process_concentration"
    t.string "process_dissolution"
    t.string "process_extraction"
    t.boolean "archived", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "picture"
    t.string "crafting"
    t.string "ritual_attribute"
    t.string "ritual_elemental_affinity"
    t.string "ritual_gender"
    t.string "ritual_opposite"
  end

  create_table "inventories", id: :serial, force: :cascade do |t|
    t.integer "character_id", null: false
    t.integer "ingredient_id", null: false
    t.integer "quantity", default: 0
    t.boolean "unlocked_calcination", default: false
    t.boolean "unlocked_concentration", default: false
    t.boolean "unlocked_dissolution", default: false
    t.boolean "unlocked_extraction", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "unlocked_crafting", default: false
    t.boolean "unlocked_ritual", default: false
    t.index ["character_id", "ingredient_id"], name: "index_inventories_on_character_id_and_ingredient_id", unique: true
    t.index ["character_id"], name: "index_inventories_on_character_id"
    t.index ["ingredient_id"], name: "index_inventories_on_ingredient_id"
  end

  create_table "profession_links", id: :serial, force: :cascade do |t|
    t.string "name", null: false
    t.integer "profession_id", null: false
    t.text "url", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "professions", id: :serial, force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_professions_on_name", unique: true
  end

  create_table "receipts", id: :serial, force: :cascade do |t|
    t.decimal "amount", precision: 8, scale: 2
    t.string "brand"
    t.string "expiry"
    t.string "last_4"
    t.string "stripe_id"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.cidr "ip_address"
  end

  create_table "recipe_books", force: :cascade do |t|
    t.bigint "character_id"
    t.bigint "recipes_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_id"], name: "index_recipe_books_on_character_id"
    t.index ["recipes_id"], name: "index_recipe_books_on_recipes_id"
  end

  create_table "recipes", force: :cascade do |t|
    t.string "name", null: false
    t.string "subtype", null: false
    t.string "category", null: false
    t.integer "level", null: false
    t.string "effect_family", null: false
    t.string "delivery", null: false
    t.string "application_time"
    t.string "duration"
    t.string "effect", null: false
    t.text "description", null: false
    t.string "hex_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "extraction_ingredient_id"
    t.bigint "calcination_ingredient_id"
    t.bigint "dissolution_ingredient_id"
    t.bigint "concentration_ingredient_id"
    t.string "slug", null: false
    t.index ["calcination_ingredient_id"], name: "index_recipes_on_calcination_ingredient_id"
    t.index ["concentration_ingredient_id"], name: "index_recipes_on_concentration_ingredient_id"
    t.index ["dissolution_ingredient_id"], name: "index_recipes_on_dissolution_ingredient_id"
    t.index ["extraction_ingredient_id"], name: "index_recipes_on_extraction_ingredient_id"
    t.index ["name"], name: "index_recipes_on_name", unique: true
    t.index ["slug"], name: "index_recipes_on_slug", unique: true
  end

  create_table "seasons", id: :serial, force: :cascade do |t|
    t.string "name", null: false
    t.string "equivalent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_seasons_on_name", unique: true
  end

  create_table "staff_profiles", id: :serial, force: :cascade do |t|
    t.text "blurb"
    t.text "contact"
    t.string "picture"
    t.boolean "published", default: false, null: false
    t.text "responsibilities"
    t.integer "series", default: 10, null: false
    t.string "title", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_staff_profiles_on_user_id", unique: true
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "confirmation_digest"
    t.datetime "confirmed_at"
    t.string "email", null: false
    t.string "first_name", null: false
    t.string "handle", null: false
    t.string "last_name", null: false
    t.string "password_digest"
    t.string "password_reset_digest"
    t.datetime "password_reset_sent_at"
    t.string "remember_digest"
    t.boolean "staff", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "failed_sign_in_attempts", default: 0
    t.datetime "last_signed_in_at"
    t.integer "sign_in_count", default: 0
    t.boolean "editor", default: false
    t.string "phone"
    t.string "street_address"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.text "self_report"
    t.boolean "banker", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["handle"], name: "index_users_on_handle", unique: true
  end

end
