# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2023_05_20_121458) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "blogs", force: :cascade do |t|
    t.string "title"
    t.text "blog_content"
    t.string "photo"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "tag"
    t.boolean "publish", default: true
  end

  create_table "cert_products", force: :cascade do |t|
    t.bigint "cert_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "product_id", null: false
    t.integer "quantity", default: 1
    t.index ["cert_id"], name: "index_cert_products_on_cert_id"
    t.index ["product_id"], name: "index_cert_products_on_product_id"
  end

  create_table "certs", force: :cascade do |t|
    t.bigint "client_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "ordered?", default: false
    t.index ["client_id"], name: "index_certs_on_client_id"
  end

  create_table "clients", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "name"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "last_name"
    t.string "phone"
    t.string "address"
    t.index ["email"], name: "index_clients_on_email", unique: true
    t.index ["reset_password_token"], name: "index_clients_on_reset_password_token", unique: true
  end

  create_table "cover_photos", force: :cascade do |t|
    t.string "photo"
    t.boolean "publish", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "discount_codes", force: :cascade do |t|
    t.string "name"
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "pusblish", default: false
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_type", "sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_type_and_sluggable_id"
  end

  create_table "order_products", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.bigint "order_id", null: false
    t.integer "quantity", default: 1
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.float "product_total_price"
    t.index ["order_id"], name: "index_order_products_on_order_id"
    t.index ["product_id"], name: "index_order_products_on_product_id"
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "client_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "cert_id", null: false
    t.integer "order_total"
    t.integer "status", default: 0
    t.index ["cert_id"], name: "index_orders_on_cert_id"
    t.index ["client_id"], name: "index_orders_on_client_id"
  end

  create_table "product_types", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "slug"
    t.text "seo_tags"
    t.index ["slug"], name: "index_product_types_on_slug", unique: true
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "size"
    t.float "price"
    t.bigint "product_type_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "photo"
    t.text "benefits"
    t.text "ingredients"
    t.string "title"
    t.text "faq"
    t.string "slug"
    t.text "seo_tags"
    t.index ["product_type_id"], name: "index_products_on_product_type_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "rating"
    t.text "comment"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "product_id", null: false
    t.index ["product_id"], name: "index_reviews_on_product_id"
  end

  create_table "slide_images", force: :cascade do |t|
    t.string "image"
    t.boolean "publish"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "cert_products", "certs"
  add_foreign_key "cert_products", "products"
  add_foreign_key "certs", "clients"
  add_foreign_key "order_products", "orders"
  add_foreign_key "order_products", "products"
  add_foreign_key "orders", "certs"
  add_foreign_key "orders", "clients"
  add_foreign_key "products", "product_types"
  add_foreign_key "reviews", "products"
end
