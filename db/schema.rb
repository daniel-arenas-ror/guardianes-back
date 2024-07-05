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

ActiveRecord::Schema[7.0].define(version: 2024_07_05_033749) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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

  add_foreign_key "service_deals", "deals"
  add_foreign_key "service_deals", "services"
  add_foreign_key "worker_deals", "deals"
  add_foreign_key "worker_deals", "workers"
end
