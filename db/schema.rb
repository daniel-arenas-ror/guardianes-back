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

ActiveRecord::Schema[7.0].define(version: 2024_07_09_044045) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource"
  end

  create_table "deals", force: :cascade do |t|
    t.string "serial", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "schedule_weeks", force: :cascade do |t|
    t.integer "day", null: false
    t.integer "from", null: false
    t.integer "to", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "deal_id", null: false
    t.index ["deal_id"], name: "index_schedule_weeks_on_deal_id"
  end

  create_table "service_deals", force: :cascade do |t|
    t.bigint "service_id", null: false
    t.bigint "deal_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deal_id"], name: "index_service_deals_on_deal_id"
    t.index ["service_id"], name: "index_service_deals_on_service_id"
  end

  create_table "services", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "turn_availabilities", force: :cascade do |t|
    t.bigint "turn_id", null: false
    t.bigint "worker_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["turn_id"], name: "index_turn_availabilities_on_turn_id"
    t.index ["worker_id"], name: "index_turn_availabilities_on_worker_id"
  end

  create_table "turns", force: :cascade do |t|
    t.string "key"
    t.integer "week"
    t.bigint "worker_id"
    t.bigint "service_deal_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "turn_date"
    t.integer "hour"
    t.index ["service_deal_id"], name: "index_turns_on_service_deal_id"
    t.index ["worker_id"], name: "index_turns_on_worker_id"
  end

  create_table "worker_deals", force: :cascade do |t|
    t.bigint "worker_id", null: false
    t.bigint "deal_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deal_id"], name: "index_worker_deals_on_deal_id"
    t.index ["worker_id"], name: "index_worker_deals_on_worker_id"
  end

  create_table "workers", force: :cascade do |t|
    t.string "name", null: false
    t.string "color", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "schedule_weeks", "deals"
  add_foreign_key "service_deals", "deals"
  add_foreign_key "service_deals", "services"
  add_foreign_key "turn_availabilities", "turns"
  add_foreign_key "turn_availabilities", "workers"
  add_foreign_key "turns", "service_deals"
  add_foreign_key "turns", "workers"
  add_foreign_key "worker_deals", "deals"
  add_foreign_key "worker_deals", "workers"
end
