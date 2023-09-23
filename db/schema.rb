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

ActiveRecord::Schema[7.0].define(version: 0) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", id: :integer, default: -> { "nextval('category_id_seq'::regclass)" }, force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.integer "weight", null: false
    t.integer "parent_id"
  end

  create_table "colors", id: :serial, force: :cascade do |t|
    t.string "color", limit: 255, null: false
  end

  create_table "shoes", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.string "material", limit: 255, null: false
  end

  create_table "shoes_categories", id: :serial, force: :cascade do |t|
    t.integer "shoe_id", null: false
    t.integer "category_id", null: false
  end

  create_table "shoes_colors_sizes", id: :integer, default: -> { "nextval('shoe_color_size_id_seq'::regclass)" }, force: :cascade do |t|
    t.integer "shoe_id", null: false
    t.integer "color_id", null: false
    t.integer "size_id", null: false
  end

  create_table "sizes", id: :integer, default: -> { "nextval('size_id_seq'::regclass)" }, force: :cascade do |t|
    t.string "size", limit: 255, null: false
    t.index ["size"], name: "size_size", unique: true
  end

  add_foreign_key "categories", "categories", column: "parent_id", name: "fk_category", on_delete: :nullify
  add_foreign_key "shoes_categories", "categories", name: "fk_category", on_delete: :cascade
  add_foreign_key "shoes_categories", "shoes", name: "fk_shoe", on_delete: :cascade
  add_foreign_key "shoes_colors_sizes", "colors", name: "fk_color", on_delete: :cascade
  add_foreign_key "shoes_colors_sizes", "shoes", name: "fk_shoe", on_delete: :cascade
  add_foreign_key "shoes_colors_sizes", "sizes", name: "fk_size", on_delete: :cascade
end
