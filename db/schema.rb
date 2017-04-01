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

ActiveRecord::Schema.define(version: 20170401015039) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.integer  "character_id"
    t.integer  "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["character_id", "user_id"], name: "index_bookings_on_character_id_and_user_id", unique: true, using: :btree
  end

  create_table "characters", force: :cascade do |t|
    t.string   "name",                       null: false
    t.text     "history",    default: ""
    t.integer  "race",       default: 0
    t.string   "slug",                       null: false
    t.integer  "user_id",                    null: false
    t.boolean  "archived",   default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "alchemist",  default: false
    t.index ["slug"], name: "index_characters_on_slug", unique: true, using: :btree
    t.index ["user_id"], name: "index_characters_on_user_id", using: :btree
  end

  create_table "events", force: :cascade do |t|
    t.string   "address"
    t.text     "directions"
    t.datetime "end_date",                  null: false
    t.float    "latitude"
    t.float    "longitude"
    t.string   "name",                      null: false
    t.string   "slug",                      null: false
    t.datetime "start_date",                null: false
    t.boolean  "visible",    default: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["slug"], name: "index_events_on_slug", unique: true, using: :btree
  end

  create_table "ingredient_professions", force: :cascade do |t|
    t.integer  "ingredient_id"
    t.integer  "profession_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["ingredient_id", "profession_id"], name: "index_ingredient_professions_on_ingredient_id_and_profession_id", unique: true, using: :btree
    t.index ["ingredient_id"], name: "index_ingredient_professions_on_ingredient_id", using: :btree
    t.index ["profession_id"], name: "index_ingredient_professions_on_profession_id", using: :btree
  end

  create_table "ingredient_seasons", force: :cascade do |t|
    t.integer  "ingredient_id"
    t.integer  "season_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["ingredient_id", "season_id"], name: "index_ingredient_seasons_on_ingredient_id_and_season_id", unique: true, using: :btree
    t.index ["ingredient_id"], name: "index_ingredient_seasons_on_ingredient_id", using: :btree
    t.index ["season_id"], name: "index_ingredient_seasons_on_season_id", using: :btree
  end

  create_table "ingredients", force: :cascade do |t|
    t.string   "name",                                  null: false
    t.text     "staff_notes"
    t.integer  "grade"
    t.integer  "category",              default: 0,     null: false
    t.integer  "rarity",                default: 0,     null: false
    t.string   "process_calcination"
    t.string   "process_concentration"
    t.string   "process_dissolution"
    t.string   "process_extraction"
    t.boolean  "archived",              default: false
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.string   "picture"
  end

  create_table "inventories", force: :cascade do |t|
    t.integer  "character_id",                           null: false
    t.integer  "ingredient_id",                          null: false
    t.integer  "quantity",               default: 0
    t.boolean  "unlocked_calcination",   default: false
    t.boolean  "unlocked_concentration", default: false
    t.boolean  "unlocked_dissolution",   default: false
    t.boolean  "unlocked_extraction",    default: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.index ["character_id", "ingredient_id"], name: "index_inventories_on_character_id_and_ingredient_id", unique: true, using: :btree
    t.index ["character_id"], name: "index_inventories_on_character_id", using: :btree
    t.index ["ingredient_id"], name: "index_inventories_on_ingredient_id", using: :btree
  end

  create_table "professions", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_professions_on_name", unique: true, using: :btree
  end

  create_table "seasons", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "equivalent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_seasons_on_name", unique: true, using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "confirmation_digest"
    t.datetime "confirmed_at"
    t.string   "email",                                   null: false
    t.string   "first_name",                              null: false
    t.string   "handle",                                  null: false
    t.string   "last_name",                               null: false
    t.string   "password_digest"
    t.string   "password_reset_digest"
    t.datetime "password_reset_sent_at"
    t.string   "remember_digest"
    t.boolean  "staff",                   default: false
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.integer  "failed_sign_in_attempts", default: 0
    t.datetime "last_signed_in_at"
    t.integer  "sign_in_count",           default: 0
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["handle"], name: "index_users_on_handle", unique: true, using: :btree
  end

end
