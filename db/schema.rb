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

ActiveRecord::Schema[7.0].define(version: 2022_09_16_081912) do
  create_table "product_details", primary_key: "detail_id", id: :string, force: :cascade do |t|
    t.string "categories"
    t.integer "price_effective"
    t.integer "price_full"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "product_id"
    t.index ["detail_id"], name: "index_product_details_on_detail_id"
  end

  create_table "products", primary_key: "product_id", id: :string, force: :cascade do |t|
    t.string "product_name"
    t.string "product_description"
    t.string "vendor"
    t.string "product_url"
    t.string "product_image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "brand"
    t.index ["product_id"], name: "index_products_on_product_id"
  end

  create_table "registries", primary_key: "registry_id", id: :string, force: :cascade do |t|
    t.integer "name"
    t.string "event"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["registry_id"], name: "index_registries_on_registry_id"
    t.index ["user_id"], name: "index_registries_on_user_id"
  end

  create_table "registry_items", force: :cascade do |t|
    t.integer "item_id", null: false
    t.integer "registry_id"
    t.index ["registry_id"], name: "index_registry_items_on_registry_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "password"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "registries", "users"
  add_foreign_key "registry_items", "registries"
end
