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

ActiveRecord::Schema.define(version: 20150222014221) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "datasets", force: :cascade do |t|
    t.string   "name"
    t.string   "file_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "graph_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "graphs", force: :cascade do |t|
    t.string   "name"
    t.integer  "dataset_id"
    t.integer  "graph_type_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "x_axis_label"
    t.string   "y_axis_label"
  end

  add_index "graphs", ["dataset_id"], name: "index_graphs_on_dataset_id", using: :btree
  add_index "graphs", ["graph_type_id"], name: "index_graphs_on_graph_type_id", using: :btree

  add_foreign_key "graphs", "datasets"
  add_foreign_key "graphs", "graph_types"
end