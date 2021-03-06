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

ActiveRecord::Schema.define(:version => 20130503013325) do

  create_table "closing_items", :force => true do |t|
    t.string   "title"
    t.string   "author"
    t.string   "notes"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "dealname"
    t.integer  "closing_id"
    t.boolean  "status"
    t.string   "messages"
  end

  create_table "closings", :force => true do |t|
    t.string   "dealname"
    t.integer  "client_number"
    t.integer  "matter_number"
    t.string   "team_leader"
    t.date     "closing_date"
    t.boolean  "closing_status"
    t.string   "inside_member"
    t.string   "outside_member"
    t.string   "deal_type"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "user_id"
    t.text     "team_member"
  end

  create_table "tasks", :force => true do |t|
    t.string   "author"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "subject"
    t.string   "status"
    t.string   "assignee"
    t.date     "deadline"
    t.string   "name"
    t.integer  "closing_item_id"
  end

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "profile_name"
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
