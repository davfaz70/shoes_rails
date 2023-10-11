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

ActiveRecord::Schema[7.0].define(version: 2023_10_11_162025) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.integer "weight", null: false
    t.integer "parent_id"
    t.index ["name"], name: "unique_name", unique: true
  end

  create_table "colors", id: :serial, force: :cascade do |t|
    t.string "color", limit: 255, null: false
    t.index ["color"], name: "colors_color_key", unique: true
  end

  create_table "shoes", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.string "material", limit: 255, null: false
    t.integer "order"
  end

  create_table "shoes_categories", id: :serial, force: :cascade do |t|
    t.integer "shoe_id", null: false
    t.integer "category_id", null: false
    t.index ["shoe_id", "category_id"], name: "shoes_categories_shoe_id_category_id_key", unique: true
  end

  create_table "shoes_colors_sizes", id: :serial, force: :cascade do |t|
    t.integer "shoe_id", null: false
    t.integer "color_id", null: false
    t.integer "size_id", null: false
    t.index ["shoe_id", "color_id", "size_id"], name: "shoes_colors_sizes_shoe_id_color_id_size_id_key", unique: true
  end

  create_table "sizes", id: :serial, force: :cascade do |t|
    t.string "size", limit: 255, null: false
    t.index ["size"], name: "sizes_size_key", unique: true
  end

  add_foreign_key "categories", "categories", column: "parent_id", name: "fk_category", on_delete: :nullify
  add_foreign_key "shoes_categories", "categories", name: "fk_category", on_delete: :cascade
  add_foreign_key "shoes_categories", "shoes", name: "fk_shoe", on_delete: :cascade
  add_foreign_key "shoes_colors_sizes", "colors", name: "fk_color", on_delete: :cascade
  add_foreign_key "shoes_colors_sizes", "shoes", name: "fk_shoe", on_delete: :cascade
  add_foreign_key "shoes_colors_sizes", "sizes", name: "fk_size", on_delete: :cascade
end
