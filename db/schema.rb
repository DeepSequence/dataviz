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

ActiveRecord::Schema.define(version: 20150310030039) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dataset_types", force: :cascade do |t|
    t.string   "name"
    t.integer  "num_cols"
    t.string   "format"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "description"
    t.string   "image_file"
  end

  create_table "datasets", force: :cascade do |t|
    t.string   "name"
    t.string   "file_name"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "dataset_type_id"
    t.string   "data_file_file_name"
    t.string   "data_file_content_type"
    t.integer  "data_file_file_size"
    t.datetime "data_file_updated_at"
    t.string   "description"
    t.integer  "user_id"
  end

  create_table "filtered_graphs", force: :cascade do |t|
    t.integer  "graph_type_id"
    t.integer  "dataset_type_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "filtered_graphs", ["dataset_type_id"], name: "index_filtered_graphs_on_dataset_type_id", using: :btree
  add_index "filtered_graphs", ["graph_type_id"], name: "index_filtered_graphs_on_graph_type_id", using: :btree

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
    t.integer  "user_id"
  end

  add_index "graphs", ["dataset_id"], name: "index_graphs_on_dataset_id", using: :btree
  add_index "graphs", ["graph_type_id"], name: "index_graphs_on_graph_type_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "token"
    t.string   "secret"
  end

  add_foreign_key "filtered_graphs", "dataset_types"
  add_foreign_key "filtered_graphs", "graph_types"
  add_foreign_key "graphs", "datasets"
  add_foreign_key "graphs", "graph_types"
end
