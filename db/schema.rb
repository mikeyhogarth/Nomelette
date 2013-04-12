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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130412100958) do

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.string   "slug"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "category_type_id"
  end

  create_table "categories_recipes", :id => false, :force => true do |t|
    t.integer "recipe_id"
    t.integer "category_id"
  end

  add_index "categories_recipes", ["category_id", "recipe_id"], :name => "index_categories_recipes_on_category_id_and_recipe_id"
  add_index "categories_recipes", ["recipe_id", "category_id"], :name => "index_categories_recipes_on_recipe_id_and_category_id"

  create_table "category_types", :force => true do |t|
    t.string   "name"
    t.string   "slug"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "recipes", :force => true do |t|
    t.string   "name"
    t.string   "serves"
    t.string   "cooking_time"
    t.text     "description"
    t.text     "ingredients"
    t.text     "method"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.text     "footnote"
    t.boolean  "vegetarian"
    t.string   "slug"
  end

  add_index "recipes", ["slug"], :name => "index_recipes_on_slug", :unique => true

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "password_digest"
    t.boolean  "admin"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

end
