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

ActiveRecord::Schema.define(version: 20151231073408) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "analysis_conclusions", force: :cascade do |t|
    t.integer  "balance"
    t.integer  "pai"
    t.integer  "overall_sentiment"
    t.integer  "future"
    t.integer  "tasting_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "analysis_conclusions", ["tasting_id"], name: "index_analysis_conclusions_on_tasting_id", using: :btree

  create_table "dominant_gustatory_persistences", force: :cascade do |t|
    t.integer  "nature"
    t.integer  "analysis_conclusion_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "dominant_gustatory_persistences", ["analysis_conclusion_id"], name: "index_dominant_gustatory_persistences_on_analysis_conclusion_id", using: :btree

  create_table "gustatory_analyses", force: :cascade do |t|
    t.integer  "acidity"
    t.integer  "alcohol"
    t.integer  "mellowness"
    t.integer  "tannin_quantity"
    t.integer  "tannin_quality"
    t.integer  "tasting_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "gustatory_analyses", ["tasting_id"], name: "index_gustatory_analyses_on_tasting_id", using: :btree

  create_table "gustatory_natures", force: :cascade do |t|
    t.integer  "nature"
    t.integer  "gustatory_analysis_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "gustatory_natures", ["gustatory_analysis_id"], name: "index_gustatory_natures_on_gustatory_analysis_id", using: :btree

  create_table "olfactory_analyses", force: :cascade do |t|
    t.integer  "intensity"
    t.integer  "diversity"
    t.integer  "quality"
    t.integer  "tasting_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "olfactory_analyses", ["tasting_id"], name: "index_olfactory_analyses_on_tasting_id", using: :btree

  create_table "olfactory_natures", force: :cascade do |t|
    t.integer  "nature"
    t.integer  "olfactory_analysis_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "olfactory_natures", ["olfactory_analysis_id"], name: "index_olfactory_natures_on_olfactory_analysis_id", using: :btree

  create_table "tastings", force: :cascade do |t|
    t.integer  "wine_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  add_index "tastings", ["user_id"], name: "index_tastings_on_user_id", using: :btree
  add_index "tastings", ["wine_id"], name: "index_tastings_on_wine_id", using: :btree

  create_table "users", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "first_name"
    t.string   "last_name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "visual_analyses", force: :cascade do |t|
    t.integer  "color"
    t.integer  "intensity"
    t.integer  "nuance"
    t.integer  "limpidity"
    t.integer  "brightness"
    t.integer  "density"
    t.integer  "effervescence"
    t.integer  "tasting_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "visual_analyses", ["tasting_id"], name: "index_visual_analyses_on_tasting_id", using: :btree

  create_table "wines", force: :cascade do |t|
    t.string   "appellation"
    t.integer  "vintage"
    t.string   "domaine"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_foreign_key "analysis_conclusions", "tastings"
  add_foreign_key "dominant_gustatory_persistences", "analysis_conclusions"
  add_foreign_key "gustatory_analyses", "tastings"
  add_foreign_key "gustatory_natures", "gustatory_analyses"
  add_foreign_key "olfactory_analyses", "tastings"
  add_foreign_key "olfactory_natures", "olfactory_analyses"
  add_foreign_key "tastings", "users"
  add_foreign_key "tastings", "wines"
  add_foreign_key "visual_analyses", "tastings"
end
