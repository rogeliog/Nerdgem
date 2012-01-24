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

ActiveRecord::Schema.define(:version => 20120124001728) do

  create_table "achievements", :force => true do |t|
    t.integer  "user_id"
    t.string   "action"
    t.integer  "value"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "authentications", :force => true do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.integer  "uid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "points", :force => true do |t|
    t.integer  "user_id"
    t.integer  "tutorial_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ruby_gems", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "info",       :limit => 255
  end

  create_table "ruby_gems_tutorials", :id => false, :force => true do |t|
    t.integer "tutorial_id"
    t.integer "ruby_gem_id"
  end

  add_index "ruby_gems_tutorials", ["ruby_gem_id", "tutorial_id"], :name => "index_ruby_gems_tutorials_on_ruby_gem_id_and_tutorial_id"

  create_table "tutorials", :force => true do |t|
    t.string   "title"
    t.integer  "user_id"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "estimated_time"
    t.string   "source_code"
    t.integer  "points_count",   :default => 0
    t.string   "repo_link"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "",       :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "",       :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "role",                                  :default => "member"
    t.string   "name"
    t.string   "image"
    t.string   "github_profile"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
