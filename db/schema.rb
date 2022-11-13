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

ActiveRecord::Schema.define(version: 2022_11_13_114709) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "matters", force: :cascade do |t|
    t.string "code", default: "DTSZN", null: false
    t.string "title", null: false
    t.text "text", null: false
    t.string "author", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["author"], name: "index_matters_on_author"
    t.index ["code"], name: "index_matters_on_code"
    t.index ["title"], name: "index_matters_on_title"
  end

  create_table "versions", force: :cascade do |t|
    t.bigint "matter_id"
    t.jsonb "version"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["matter_id"], name: "index_versions_on_matter_id"
  end

end
