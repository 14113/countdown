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

ActiveRecord::Schema.define(:version => 20120416233218) do

  create_table "counters", :force => true do |t|
    t.string   "name"
    t.datetime "date"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "title"
  end

  add_index "counters", ["title"], :name => "index_counters_on_title"

  create_table "user_counters", :force => true do |t|
    t.string   "user_id"
    t.integer  "counter_id"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.boolean  "hide",       :default => false
    t.string   "title"
  end

  add_index "user_counters", ["counter_id"], :name => "index_user_counters_on_counter_id"
  add_index "user_counters", ["user_id"], :name => "index_user_counters_on_user_id"

end
