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

ActiveRecord::Schema.define(:version => 20130313021957) do

  create_table "accounts", :force => true do |t|
    t.string   "name",                             :null => false
    t.integer  "nat_number_count",  :default => 1, :null => false
    t.integer  "serv_number_count", :default => 2, :null => false
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
  end

  create_table "agents", :force => true do |t|
    t.integer  "group_id",                      :null => false
    t.integer  "user_id",                       :null => false
    t.integer  "group_priority", :default => 0, :null => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  add_index "agents", ["group_id"], :name => "index_agents_on_group_id"
  add_index "agents", ["user_id"], :name => "index_agents_on_user_id"

  create_table "call_menus", :force => true do |t|
    t.integer  "phone_number_id",                 :null => false
    t.string   "menu_message",    :default => "", :null => false
    t.integer  "menu_key1",       :default => 0,  :null => false
    t.integer  "menu_key2",       :default => 0,  :null => false
    t.integer  "menu_key3",       :default => 0,  :null => false
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  add_index "call_menus", ["phone_number_id"], :name => "index_call_menus_on_phone_number_id"

  create_table "call_queues", :force => true do |t|
    t.integer  "phone_number_id",                    :null => false
    t.integer  "group_id",                           :null => false
    t.string   "music_on_hold",   :default => "",    :null => false
    t.boolean  "place_inform",    :default => false, :null => false
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
  end

  add_index "call_queues", ["group_id"], :name => "index_call_queues_on_group_id"
  add_index "call_queues", ["phone_number_id"], :name => "index_call_queues_on_phone_number_id"

  create_table "call_times", :force => true do |t|
    t.integer  "phone_number_id",                     :null => false
    t.string   "greeting_whrs",    :default => "",    :null => false
    t.string   "greeting_afthrs",  :default => "",    :null => false
    t.time     "mon_start1"
    t.time     "mon_stop1"
    t.time     "tues_start1"
    t.time     "tues_stop1"
    t.time     "wed_start1"
    t.time     "wed_stop1"
    t.time     "thu_start1"
    t.time     "thu_stop1"
    t.time     "fri_start1"
    t.time     "fri_stop1"
    t.time     "sat_start1"
    t.time     "sat_stop1"
    t.time     "sun_start1"
    t.time     "sun_stop1"
    t.time     "default_start1"
    t.time     "default_stop1"
    t.boolean  "default_override", :default => false, :null => false
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
  end

  add_index "call_times", ["phone_number_id"], :name => "index_call_times_on_phone_number_id"

  create_table "groups", :force => true do |t|
    t.integer  "account_id",                           :null => false
    t.string   "group_name",   :default => "",         :null => false
    t.string   "group_type",   :default => "parallel", :null => false
    t.integer  "ring_timeout", :default => 30,         :null => false
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
  end

  add_index "groups", ["account_id"], :name => "index_groups_on_account_id"

  create_table "phone_numbers", :force => true do |t|
    t.string   "number",                         :null => false
    t.integer  "number_type",                    :null => false
    t.integer  "account_id",  :default => 0,     :null => false
    t.string   "dnid",        :default => "",    :null => false
    t.boolean  "ivr_enabled", :default => false, :null => false
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  add_index "phone_numbers", ["account_id"], :name => "index_phone_numbers_on_account_id"

  create_table "user_sessions", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "first_name",         :default => "", :null => false
    t.string   "last_name",          :default => "", :null => false
    t.string   "email",              :default => "", :null => false
    t.integer  "level",              :default => 0,  :null => false
    t.string   "phone",              :default => "", :null => false
    t.integer  "account_id",         :default => 0,  :null => false
    t.string   "login",                              :null => false
    t.string   "persistence_token",                  :null => false
    t.string   "crypted_password",                   :null => false
    t.string   "password_salt",                      :null => false
    t.integer  "login_count",        :default => 0,  :null => false
    t.integer  "failed_login_count", :default => 0,  :null => false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
  end

  add_index "users", ["account_id"], :name => "index_users_on_account_id"

end
