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

ActiveRecord::Schema.define(version: 2019_06_03_183744) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "business_types", force: :cascade do |t|
    t.string "name", null: false
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_business_types_on_name", unique: true
  end

  create_table "location_attention_schedules", force: :cascade do |t|
    t.bigint "location_id"
    t.integer "day", null: false
    t.time "start_hour", default: "2000-01-01 00:00:00", null: false
    t.time "end_hour", default: "2000-01-01 23:59:00", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_id"], name: "index_location_attention_schedules_on_location_id"
  end

  create_table "location_business_types", force: :cascade do |t|
    t.bigint "location_id"
    t.bigint "business_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["business_type_id"], name: "index_location_business_types_on_business_type_id"
    t.index ["location_id"], name: "index_location_business_types_on_location_id"
  end

  create_table "location_images", force: :cascade do |t|
    t.bigint "location_id"
    t.string "url_image", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_id"], name: "index_location_images_on_location_id"
  end

  create_table "location_installation_dates", force: :cascade do |t|
    t.bigint "location_id"
    t.datetime "date_time", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.text "comments"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_id"], name: "index_location_installation_dates_on_location_id"
  end

  create_table "location_nearby_place_tags", force: :cascade do |t|
    t.bigint "location_id"
    t.bigint "nearby_place_tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_id"], name: "index_location_nearby_place_tags_on_location_id"
    t.index ["nearby_place_tag_id"], name: "index_location_nearby_place_tags_on_nearby_place_tag_id"
  end

  create_table "location_operators", force: :cascade do |t|
    t.bigint "location_id"
    t.bigint "operator_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_id"], name: "index_location_operators_on_location_id"
    t.index ["operator_id"], name: "index_location_operators_on_operator_id"
  end

  create_table "location_phones", force: :cascade do |t|
    t.bigint "location_id"
    t.string "phone_number", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_id"], name: "index_location_phones_on_location_id"
  end

  create_table "location_types", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_location_types_on_name", unique: true
  end

  create_table "locations", force: :cascade do |t|
    t.string "name", null: false
    t.string "address", null: false
    t.bigint "location_type_id"
    t.string "business_email"
    t.string "lat"
    t.string "lng"
    t.integer "status", default: 1, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_type_id"], name: "index_locations_on_location_type_id"
  end

  create_table "nearby_place_tags", force: :cascade do |t|
    t.string "name", null: false
    t.integer "status", default: 1, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_nearby_place_tags_on_name", unique: true
  end

  create_table "operators", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "email"
    t.string "phone_number", null: false
    t.string "position", null: false
    t.string "description"
    t.integer "type_operator", default: 1, null: false
    t.integer "status", default: 1, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "permissions", force: :cascade do |t|
    t.string "name", null: false
    t.string "description"
    t.string "slug", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_permissions_on_name", unique: true
    t.index ["slug"], name: "index_permissions_on_slug", unique: true
  end

  create_table "role_permissions", force: :cascade do |t|
    t.bigint "permission_id"
    t.bigint "role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["permission_id"], name: "index_role_permissions_on_permission_id"
    t.index ["role_id"], name: "index_role_permissions_on_role_id"
  end

  create_table "role_users", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role_id"], name: "index_role_users_on_role_id"
    t.index ["user_id"], name: "index_role_users_on_user_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name", null: false
    t.string "description"
    t.string "slug", null: false
    t.integer "lavel", null: false
    t.integer "status", default: 1, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_roles_on_name", unique: true
    t.index ["slug"], name: "index_roles_on_slug", unique: true
  end

  create_table "screen_brands", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_screen_brands_on_name", unique: true
  end

  create_table "screen_types", force: :cascade do |t|
    t.string "name", null: false
    t.integer "status", default: 1, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_screen_types_on_name", unique: true
  end

  create_table "screens", force: :cascade do |t|
    t.bigint "screen_type_id"
    t.bigint "screen_brand_id"
    t.bigint "location_id"
    t.string "code", default: "", null: false
    t.string "model", default: "", null: false
    t.string "sku", default: "", null: false
    t.string "orientation", default: "", null: false
    t.string "size_inches", default: "-", null: false
    t.string "description", default: ""
    t.integer "status", default: 1, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_id"], name: "index_screens_on_location_id"
    t.index ["screen_brand_id"], name: "index_screens_on_screen_brand_id"
    t.index ["screen_type_id"], name: "index_screens_on_screen_type_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "last_name", null: false
    t.string "username", null: false
    t.string "email", null: false
    t.string "password_digest", null: false
    t.integer "status", default: 1, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "location_attention_schedules", "locations", on_delete: :cascade
  add_foreign_key "location_business_types", "business_types", on_delete: :cascade
  add_foreign_key "location_business_types", "locations", on_delete: :cascade
  add_foreign_key "location_images", "locations", on_delete: :cascade
  add_foreign_key "location_installation_dates", "locations", on_delete: :cascade
  add_foreign_key "location_nearby_place_tags", "locations", on_delete: :cascade
  add_foreign_key "location_nearby_place_tags", "nearby_place_tags", on_delete: :cascade
  add_foreign_key "location_operators", "locations", on_delete: :cascade
  add_foreign_key "location_operators", "operators", on_delete: :cascade
  add_foreign_key "location_phones", "locations"
  add_foreign_key "locations", "location_types"
  add_foreign_key "role_permissions", "permissions"
  add_foreign_key "role_permissions", "roles"
  add_foreign_key "role_users", "roles"
  add_foreign_key "role_users", "users"
  add_foreign_key "screens", "locations"
  add_foreign_key "screens", "screen_brands"
  add_foreign_key "screens", "screen_types"
end
