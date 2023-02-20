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

ActiveRecord::Schema[7.0].define(version: 2023_02_19_183426) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "components", force: :cascade do |t|
    t.bigint "content_id", null: false
    t.string "element_type", null: false
    t.bigint "element_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["content_id"], name: "index_components_on_content_id"
    t.index ["element_type", "element_id"], name: "index_components_on_element"
  end

  create_table "contents", force: :cascade do |t|
    t.bigint "page_id", null: false
    t.string "content_kind"
    t.jsonb "options", default: "{}", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["options"], name: "index_contents_on_options", using: :gin
    t.index ["page_id"], name: "index_contents_on_page_id"
  end

  create_table "element_buttons", force: :cascade do |t|
    t.string "label"
    t.string "href"
    t.jsonb "options", default: "{}", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["options"], name: "index_element_buttons_on_options", using: :gin
  end

  create_table "element_h1s", force: :cascade do |t|
    t.string "title"
    t.jsonb "options", default: "{}", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["options"], name: "index_element_h1s_on_options", using: :gin
  end

  create_table "element_h2s", force: :cascade do |t|
    t.string "title"
    t.jsonb "options", default: "{}", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["options"], name: "index_element_h2s_on_options", using: :gin
  end

  create_table "element_images", force: :cascade do |t|
    t.string "src"
    t.jsonb "options", default: "{}", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["options"], name: "index_element_images_on_options", using: :gin
  end

  create_table "pages", force: :cascade do |t|
    t.string "name"
    t.jsonb "defaults", default: "{}", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["defaults"], name: "index_pages_on_defaults", using: :gin
  end

  create_table "sections", force: :cascade do |t|
    t.integer "order"
    t.bigint "page_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["page_id"], name: "index_sections_on_page_id"
  end

  add_foreign_key "components", "contents"
  add_foreign_key "contents", "pages"
  add_foreign_key "sections", "pages"
end
