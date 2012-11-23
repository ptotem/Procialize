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

ActiveRecord::Schema.define(:version => 20121123085433) do

  create_table "attendees", :force => true do |t|
    t.string   "attendee_name"
    t.integer  "user_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "event_id"
  end

  create_table "broadcasts", :force => true do |t|
    t.integer  "event_id"
    t.integer  "organizer_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "decks", :force => true do |t|
    t.string   "deck_name"
    t.integer  "event_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "event_locations", :force => true do |t|
    t.integer  "event_id"
    t.integer  "location_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "events", :force => true do |t|
    t.string   "event_name"
    t.text     "event_description"
    t.string   "event_location"
    t.integer  "organizer_id"
    t.integer  "user_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.datetime "start_at"
    t.datetime "end_at"
    t.string   "event_day"
  end

  create_table "feedbacks", :force => true do |t|
    t.text     "feedback_details"
    t.integer  "event_id"
    t.integer  "attendee_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "grafiti_walls", :force => true do |t|
    t.text     "wall_message"
    t.integer  "attendee_id"
    t.integer  "user_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "locations", :force => true do |t|
    t.string   "name"
    t.integer  "meeting_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "meetings", :force => true do |t|
    t.string   "meeting_name"
    t.text     "meeting_description"
    t.string   "meeting_location"
    t.datetime "meeting_datetime"
    t.integer  "user_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.datetime "start_at"
    t.datetime "end_at"
  end

  create_table "messages", :force => true do |t|
    t.text     "message_details"
    t.integer  "attendee_id"
    t.integer  "meeting_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "notice_boards", :force => true do |t|
    t.text     "board_messages"
    t.integer  "broadcast_id"
    t.integer  "user_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "organizers", :force => true do |t|
    t.string   "organizer_name"
    t.integer  "user_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "profiles", :force => true do |t|
    t.string   "profile_name"
    t.string   "interest"
    t.integer  "user_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "rails_admin_histories", :force => true do |t|
    t.text     "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      :limit => 2
    t.integer  "year",       :limit => 5
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], :name => "index_rails_admin_histories"

  create_table "speakers", :force => true do |t|
    t.string   "speaker_name"
    t.integer  "user_id"
    t.integer  "event_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "statuses", :force => true do |t|
    t.integer  "user_id"
    t.text     "comment"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
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
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "headline"
    t.string   "industry"
    t.string   "picture"
    t.string   "public_profile"
    t.string   "location"
    t.string   "positions"
    t.string   "educations"
    t.string   "token"
    t.string   "secret"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
