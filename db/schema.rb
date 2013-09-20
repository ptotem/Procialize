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

ActiveRecord::Schema.define(:version => 20130920091039) do

  create_table "assets_downloads", :force => true do |t|
    t.string   "downloadable_file_name"
    t.string   "downloadable_content_type"
    t.integer  "downloadable_file_size"
    t.datetime "downloadable_updated_at"
    t.integer  "event_id"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.integer  "track_id"
    t.text     "viewer"
  end

  create_table "attendees", :force => true do |t|
    t.integer  "user_id"
    t.integer  "event_id"
    t.text     "feedback"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "track_id"
  end

  create_table "cms_blocks", :force => true do |t|
    t.integer  "page_id",    :null => false
    t.string   "identifier", :null => false
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "cms_blocks", ["page_id", "identifier"], :name => "index_cms_blocks_on_page_id_and_identifier"

  create_table "cms_categories", :force => true do |t|
    t.integer "site_id",          :null => false
    t.string  "label",            :null => false
    t.string  "categorized_type", :null => false
  end

  add_index "cms_categories", ["site_id", "categorized_type", "label"], :name => "index_cms_categories_on_site_id_and_categorized_type_and_label", :unique => true

  create_table "cms_categorizations", :force => true do |t|
    t.integer "category_id",      :null => false
    t.string  "categorized_type", :null => false
    t.integer "categorized_id",   :null => false
  end

  add_index "cms_categorizations", ["category_id", "categorized_type", "categorized_id"], :name => "index_cms_categorizations_on_cat_id_and_catd_type_and_catd_id", :unique => true

  create_table "cms_files", :force => true do |t|
    t.integer  "site_id",                                          :null => false
    t.integer  "block_id"
    t.string   "label",                                            :null => false
    t.string   "file_file_name",                                   :null => false
    t.string   "file_content_type",                                :null => false
    t.integer  "file_file_size",                                   :null => false
    t.string   "description",       :limit => 2048
    t.integer  "position",                          :default => 0, :null => false
    t.datetime "created_at",                                       :null => false
    t.datetime "updated_at",                                       :null => false
  end

  add_index "cms_files", ["site_id", "block_id"], :name => "index_cms_files_on_site_id_and_block_id"
  add_index "cms_files", ["site_id", "file_file_name"], :name => "index_cms_files_on_site_id_and_file_file_name"
  add_index "cms_files", ["site_id", "label"], :name => "index_cms_files_on_site_id_and_label"
  add_index "cms_files", ["site_id", "position"], :name => "index_cms_files_on_site_id_and_position"

  create_table "cms_layouts", :force => true do |t|
    t.integer  "site_id",                                           :null => false
    t.integer  "parent_id"
    t.string   "app_layout"
    t.string   "label",                                             :null => false
    t.string   "identifier",                                        :null => false
    t.text     "content",    :limit => 16777215
    t.text     "css",        :limit => 16777215
    t.text     "js",         :limit => 16777215
    t.integer  "position",                       :default => 0,     :null => false
    t.boolean  "is_shared",                      :default => false, :null => false
    t.datetime "created_at",                                        :null => false
    t.datetime "updated_at",                                        :null => false
  end

  add_index "cms_layouts", ["parent_id", "position"], :name => "index_cms_layouts_on_parent_id_and_position"
  add_index "cms_layouts", ["site_id", "identifier"], :name => "index_cms_layouts_on_site_id_and_identifier", :unique => true

  create_table "cms_pages", :force => true do |t|
    t.integer  "site_id",                                               :null => false
    t.integer  "layout_id"
    t.integer  "parent_id"
    t.integer  "target_page_id"
    t.string   "label",                                                 :null => false
    t.string   "slug"
    t.string   "full_path",                                             :null => false
    t.text     "content",        :limit => 16777215
    t.integer  "position",                           :default => 0,     :null => false
    t.integer  "children_count",                     :default => 0,     :null => false
    t.boolean  "is_published",                       :default => true,  :null => false
    t.boolean  "is_shared",                          :default => false, :null => false
    t.datetime "created_at",                                            :null => false
    t.datetime "updated_at",                                            :null => false
  end

  add_index "cms_pages", ["parent_id", "position"], :name => "index_cms_pages_on_parent_id_and_position"
  add_index "cms_pages", ["site_id", "full_path"], :name => "index_cms_pages_on_site_id_and_full_path"

  create_table "cms_revisions", :force => true do |t|
    t.string   "record_type",                     :null => false
    t.integer  "record_id",                       :null => false
    t.text     "data",        :limit => 16777215
    t.datetime "created_at"
  end

  add_index "cms_revisions", ["record_type", "record_id", "created_at"], :name => "index_cms_revisions_on_record_type_and_record_id_and_created_at"

  create_table "cms_sites", :force => true do |t|
    t.string  "label",                          :null => false
    t.string  "identifier",                     :null => false
    t.string  "hostname",                       :null => false
    t.string  "path"
    t.string  "locale",      :default => "en",  :null => false
    t.boolean "is_mirrored", :default => false, :null => false
  end

  add_index "cms_sites", ["hostname"], :name => "index_cms_sites_on_hostname"
  add_index "cms_sites", ["is_mirrored"], :name => "index_cms_sites_on_is_mirrored"

  create_table "cms_snippets", :force => true do |t|
    t.integer  "site_id",                                           :null => false
    t.string   "label",                                             :null => false
    t.string   "identifier",                                        :null => false
    t.text     "content",    :limit => 16777215
    t.integer  "position",                       :default => 0,     :null => false
    t.boolean  "is_shared",                      :default => false, :null => false
    t.datetime "created_at",                                        :null => false
    t.datetime "updated_at",                                        :null => false
  end

  add_index "cms_snippets", ["site_id", "identifier"], :name => "index_cms_snippets_on_site_id_and_identifier", :unique => true
  add_index "cms_snippets", ["site_id", "position"], :name => "index_cms_snippets_on_site_id_and_position"

  create_table "concierge_services", :force => true do |t|
    t.string   "name"
    t.text     "comment"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "conferences", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.date     "starting"
    t.date     "ending"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "decks", :force => true do |t|
    t.integer  "event_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  create_table "event", :force => true do |t|
    t.integer  "sequence"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "event_days", :force => true do |t|
    t.string   "name"
    t.integer  "conference_id"
    t.integer  "sequence"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.date     "event_date"
    t.integer  "meeting_id"
  end

  create_table "event_locations", :force => true do |t|
    t.integer  "event_id"
    t.integer  "location_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "events", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "start"
    t.datetime "end"
    t.integer  "event_day_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.boolean  "quest"
    t.integer  "tracking_id"
  end

  create_table "exhibitor_imports", :force => true do |t|
    t.string   "exhibitor_details_file_name"
    t.string   "exhibitor_details_content_type"
    t.integer  "exhibitor_details_file_size"
    t.datetime "exhibitor_details_updated_at"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  create_table "exhibitor_users", :force => true do |t|
    t.integer  "exhibitor_id"
    t.integer  "user_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "exhibitors", :force => true do |t|
    t.string   "exhi_logo_file_name"
    t.string   "exhi_logo_content_type"
    t.integer  "exhi_logo_file_size"
    t.datetime "exhi_logo_updated_at"
    t.text     "stall_no"
    t.text     "industry"
    t.string   "brouchers_file_name"
    t.string   "brouchers_content_type"
    t.integer  "brouchers_file_size"
    t.datetime "brouchers_updated_at"
    t.text     "description"
    t.string   "name"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
    t.string   "broucher2_file_name"
    t.string   "broucher2_content_type"
    t.integer  "broucher2_file_size"
    t.datetime "broucher2_updated_at"
  end

  create_table "followers", :force => true do |t|
    t.integer  "user_id"
    t.integer  "follower_id"
    t.integer  "conference_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "home_page_logos", :force => true do |t|
    t.string   "image_one_file_name"
    t.string   "image_one_content_type"
    t.integer  "image_one_file_size"
    t.datetime "image_one_updated_at"
    t.string   "image_two_file_name"
    t.string   "image_two_content_type"
    t.integer  "image_two_file_size"
    t.datetime "image_two_updated_at"
    t.string   "image_three_file_name"
    t.string   "image_three_content_type"
    t.integer  "image_three_file_size"
    t.datetime "image_three_updated_at"
    t.string   "image_four_file_name"
    t.string   "image_four_content_type"
    t.integer  "image_four_file_size"
    t.datetime "image_four_updated_at"
    t.string   "image_five_file_name"
    t.string   "image_five_content_type"
    t.integer  "image_five_file_size"
    t.datetime "image_five_updated_at"
    t.string   "image_six_file_name"
    t.string   "image_six_content_type"
    t.integer  "image_six_file_size"
    t.datetime "image_six_updated_at"
    t.string   "image_seven_file_name"
    t.string   "image_seven_content_type"
    t.integer  "image_seven_file_size"
    t.datetime "image_seven_updated_at"
    t.string   "image_eight_file_name"
    t.string   "image_eight_content_type"
    t.integer  "image_eight_file_size"
    t.datetime "image_eight_updated_at"
    t.string   "image_nine_file_name"
    t.string   "image_nine_content_type"
    t.integer  "image_nine_file_size"
    t.datetime "image_nine_updated_at"
    t.string   "image_ten_file_name"
    t.string   "image_ten_content_type"
    t.integer  "image_ten_file_size"
    t.datetime "image_ten_updated_at"
    t.string   "event_image_file_name"
    t.string   "event_image_content_type"
    t.integer  "event_image_file_size"
    t.datetime "event_image_updated_at"
    t.string   "conference_image_file_name"
    t.string   "conference_image_content_type"
    t.integer  "conference_image_file_size"
    t.datetime "conference_image_updated_at"
    t.string   "sponsor_image_file_name"
    t.string   "sponsor_image_content_type"
    t.integer  "sponsor_image_file_size"
    t.datetime "sponsor_image_updated_at"
    t.string   "event_one_image_file_name"
    t.string   "event_one_image_content_type"
    t.integer  "event_one_image_file_size"
    t.datetime "event_one_image_updated_at"
    t.string   "event_two_image_file_name"
    t.string   "event_two_image_content_type"
    t.integer  "event_two_image_file_size"
    t.datetime "event_two_image_updated_at"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "invitees", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "locations", :force => true do |t|
    t.string   "name"
    t.integer  "conference_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "logos", :force => true do |t|
    t.string   "splash_pic_file_name"
    t.string   "splash_pic_content_type"
    t.integer  "splash_pic_file_size"
    t.datetime "splash_pic_updated_at"
    t.string   "oragnizer_pic_file_name"
    t.string   "oragnizer_pic_content_type"
    t.integer  "oragnizer_pic_file_size"
    t.datetime "oragnizer_pic_updated_at"
    t.string   "cheif_sponsor_file_name"
    t.string   "cheif_sponsor_content_type"
    t.integer  "cheif_sponsor_file_size"
    t.datetime "cheif_sponsor_updated_at"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  create_table "meeters", :force => true do |t|
    t.integer  "meeting_id"
    t.integer  "user_id"
    t.text     "status"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.boolean  "check"
  end

  create_table "meetings", :force => true do |t|
    t.string   "name"
    t.string   "location"
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "user_id"
    t.integer  "event_day_id"
    t.boolean  "checking"
  end

  create_table "messages", :force => true do |t|
    t.string   "name"
    t.text     "body"
    t.integer  "user_id"
    t.integer  "conference_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "news_feeds", :force => true do |t|
    t.text     "feed_news"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "organizers", :force => true do |t|
    t.integer  "conference_id"
    t.integer  "user_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "participants", :force => true do |t|
    t.integer  "conference_id"
    t.integer  "user_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "posts", :force => true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.integer  "conference_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "pro_logos", :force => true do |t|
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "questionables", :force => true do |t|
    t.integer  "event_id"
    t.integer  "user_id"
    t.boolean  "approved"
    t.string   "quest_name"
    t.integer  "up_votes"
    t.integer  "down_votes"
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
    t.boolean  "hide"
    t.integer  "like",       :default => 0
    t.string   "liking_by",  :default => "0"
    t.integer  "track_id"
  end

  create_table "rails_admin_histories", :force => true do |t|
    t.text     "messages"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      :limit => 2
    t.integer  "year",       :limit => 8
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], :name => "index_rails_admin_histories"

  create_table "ratings", :force => true do |t|
    t.integer  "event_id"
    t.integer  "user_id"
    t.integer  "rate"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "track_id"
  end

  create_table "receipients", :force => true do |t|
    t.integer  "message_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.boolean  "status"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "speakers", :force => true do |t|
    t.integer  "event_id"
    t.integer  "user_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.string   "name"
    t.text     "speaker_details"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  create_table "statuses", :force => true do |t|
    t.integer  "user_id"
    t.text     "comment"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.boolean  "autogen"
    t.boolean  "public"
  end

  create_table "survey_answers", :force => true do |t|
    t.integer  "survey_question_id"
    t.integer  "user_id"
    t.string   "ans"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "survey_questions", :force => true do |t|
    t.text     "quest"
    t.string   "option_a"
    t.string   "option_b"
    t.string   "option_c"
    t.string   "option_d"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "track_speakers", :force => true do |t|
    t.integer  "track_id"
    t.integer  "speaker_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "tracks", :force => true do |t|
    t.integer  "event_id"
    t.string   "name"
    t.text     "description"
    t.datetime "start"
    t.datetime "end"
    t.string   "track_img_file_name"
    t.string   "track_img_content_type"
    t.integer  "track_img_file_size"
    t.datetime "track_img_updated_at"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
    t.integer  "speaker_id"
  end

  create_table "user_imports", :force => true do |t|
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.string   "user_details_file_name"
    t.string   "user_details_content_type"
    t.integer  "user_details_file_size"
    t.datetime "user_details_updated_at"
  end

  create_table "user_locations", :force => true do |t|
    t.integer  "user_id"
    t.integer  "location_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                   :default => "",    :null => false
    t.string   "encrypted_password",      :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",           :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
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
    t.string   "batchie"
    t.text     "location_recco"
    t.text     "industry_recco"
    t.text     "company"
    t.integer  "no_of_views",             :default => 0
    t.text     "viewers_name"
    t.integer  "themes",                  :default => 0
    t.string   "interest"
    t.string   "recommend"
    t.string   "role"
    t.boolean  "recommend_select",        :default => false
    t.string   "user_name"
    t.string   "user_photo_file_name"
    t.string   "user_photo_content_type"
    t.integer  "user_photo_file_size"
    t.datetime "user_photo_updated_at"
    t.text     "skills"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
