ProcializeApp::Application.routes.draw do

  devise_for :users, :controllers => {:omniauth_callbacks => "users/omniauth_callbacks"}
  match 'linkedin_desktop',:to => "desktop_view#linkedin_desktop" ,:as => "linkedin_desktop"

  get "desktop_view/index"

  get "ratings/index"

  get "speaker/index"

  get "moderator/moderator_view"

  get "moderator_view/moderator"


  match 'events/update_artists/:event_day_id', :to => "events#update_artists"#, :as => "update_artists"
  match 'events/update_songs/:event_id', :to => "events#update_songs"#, :as => "update_songs"
  match 'desktop_view/update_track/:event_day_id', :to => "desktop_view#update_track"#, :as => "update_track"
  match 'desktop_view/update_event/:event_id', :to => "desktop_view#update_event" #, :as => "update_event"



  #match '/excel_imp', :to => "users/profile#excel_imp" , :as => "excel_imp"
  #match '/user_excel_imp', :to => "users/profile#excel_imp" , :as => "excel_imp"


  #resources :questionables

  resources :invitees
  resources :user_imports
  match '/excel_imp', :to => "user_imports#excel_imp" , :as => "excel_imp"


  mount RailsAdmin::Engine => '/organizer', :as => 'rails_admin'
  mount RailsAdminImport::Engine => '/rails_admin_import', :as => 'rails_admin_import'

  resources :meetings
  resources :messages
  resources :events do
    resources :questionables
  end
  resources :contacts

  match 'users/:id/profile', :to => "users/profile#index", :as => "user_profile"
  match 'users/:id/profile/edit', :to => "users/profile#edit", :as => "edit_user_profile"
  match 'users/:id/follow', :to => "users/profile#following", :as => "follow"
  match '/update_status', :to => "home#update_status", :as => "update_status"

  match '/messages/focus/new/:id/(:message)/(:all)', :to => "messages#focussed_new", :as => "focussed_message"


  match '/meetings/focus/new/:id', :to => "meetings#focussed_new", :as => "focussed_meeting"


  match '/meeting_new_user', :to => "meetings#meeting_new_user", :as => "meeting_new_user"
  #match '/meeter_users', :to => "meetings#meeter_users", :as => "meeter_users"
  match '/message_new_user', :to => "messages#message_new_user", :as => "message_new_user"

  match '/show_page/event/:id', :to => 'events#show_page', :as => "show_track"
  match '/track_page/event/:id', :to => 'events#track_page', :as => "event_track"

  match '/followers_status', :to => "home#followers_status", :as => "followers_status"
  match '/accept/event/:id', :to => "events#accept", :as => "attend_event"
  match '/accept/meeting/:id', :to => "meetings#accept", :as => "accept_meeting"
  match '/decline/meeting/:id', :to => "meetings#decline", :as => "decline_meeting"
  match '/update_location', :to => "application#update_location", :as => "update_location"
  get 'search/search'
  match 'users/:id/edit', :to => "users/profile#edit", :as => "edit"
  match 'users/:id/update', :to => "users/profile#update", :as => "update"
  match '/messages/:id', :to => "messages#show"
  match '/create_question', :to => "questionables#create_question",:as => "create_question"
  #match '/question_view', :to => "questionables#question_view", :as => "create_question"
  match '/hide_quest', :to => "questionables#hide_quest", :as => "hide_quest"
  match '/approve_quest', :to => "questionables#approve_quest", :as => "approve_quest"
  #match '/questionables/index', :to => "questionables#index"
  match '/questionables/index/(:id)', :to => "questionables#index"
  match '/unapproved_view', :to => "questionables#unapproved_view"
  match '/print/(:id)', :to => "questionables#print"
  match '/graffiti', :to => "home#graffiti"
  match '/speaker', :to => "speaker#index"
  match '/ask_question', :to => "questionables#ask_question", :as => "ask_question"
  match '/ratings', :to => "ratings#index"
  match '/user_event', :to => "ratings#user_event", :as => "user_event"
  match '/rating_up', :to => "ratings#rating_up", :as => "rating_up"
  match "/send_mailers", :to => "invitees#send_mailers", :as => "send_mailers"
  match "/send_mailers_recommend", :to => "invitees#send_mailers_recommend", :as => "send_mailers_recommend" #---------for desktop------------#
  match "/search_delegates", :to => "search#search_delegates"
  #match "/no_of_views" ,:to => "users/profile#no_of_views" ,:as => "views"
  match "/logos", :to => "application#logos", :as => "logos"
  match "/create_quest", :to => "events#create_quest", :as => "create_quest"

  match '/themes', :to => "home#theme_changer", :as => "themes"
  match '/users/auth/:provider/callback' => 'users/omniauth_callbacks#facebook'
  match '/voting' => "questionables#voting", :as => "voting"
  match '/concierge_service' => "home#concierge_service", :as => 'concierge_service'
  match '/order_services/:message' => "home#order_services", :as => 'order_services'
  match '/recommendation' => "home#recommendation", :as => 'recommendation'
  match '/gettweets', :to => "home#gettweets"
  match '/settweetcounter/:count', :to => "home#settweetcounter"
  match '/assets_download', :to => "home#assets_download", :as => "assets_download"

  match '/send_mail_to_recommended_users', :to => "home#send_mail_to_recommended_users", :as => "send_mail_to_recommended_users"
  match '/survey', :to => "home#survey"
  match '/survey_storing', :to => "home#survey_storing", :as => "survey_storing"


  match '/editing_profile', :to => "home#editing_profile", :as => "editing_profile"
  match '/editing_profile_location', :to => "home#editing_profile_location", :as => "editing_profile_location"
  match '/editing_profile_skills', :to => "home#editing_profile_skills", :as => "editing_profile_skills"
  match '/editing_profile_interest', :to => "home#editing_profile_interest", :as => "editing_profile_interest"


  match '/questions_appending/:track_id', :to => "questionables#questions_appending", :as => "questions_appending"
  match '/questions_finding', :to => "questionables#questions_finding", :as => "questions_finding"

  match '/rating_appending', :to => "ratings#rating_appending", :as => "rating_appending"
  match '/complete', :to => "meetings#complete", :as => "complete"


  #-------Desktop_view-----------#
  resources :desktop_view


  #---------Events----------#
  match '/desktop_events', :to => 'desktop_view#desktop_events', :as => "desktop_events"
  match '/events_show/:id', :to => "desktop_view#events_show", :as => "events_show"
  match '/desktop_create_quest', :to => "desktop_view#desktop_create_quest", :as => "desktop_create_quest"
  match '/desktop_accept/event/:id', :to => "desktop_view#desktop_accept", :as => "desktop_accept"
  #---------Events----------#


  #---------Ratings----------#
  match '/feed_me', :to => "desktop_view#feed_me", :as => "feed_me"
  match '/desktop_ratings', :to => "desktop_view#desktop_ratings", :as => "desktop_ratings"
  match '/desktop_rating_appending', :to => "desktop_view#desktop_rating_appending", :as => "desktop_rating_appending"
  #---------Ratings----------#


  #---------Meetings----------#
  match '/meetings_index', :to => 'desktop_view#meetings_index', :as => "meetings_index"
  match '/desktop_focussed_new/:id', :to => "desktop_view#desktop_focussed_new", :as => "desktop_focussed_meeting"
  match '/meetings_new', :to => "desktop_view#meetings_new"
  match '/meetings_create', :to => "desktop_view#meetings_create", :as => "meetings_create"
  match '/meetings_show/:id', :to => "desktop_view#meetings_show", :as => "meetings_show"
  match '/meetings_accept/meeting/:id', :to => "desktop_view#meetings_accept", :as => "meetings_accept"
  match '/meetings_edit/:id', :to => "desktop_view#meetings_edit"
  match '/desktop_meeting_new_user', :to => "desktop_view#desktop_meeting_new_user", :as => "desktop_meeting_new_user"
  #---------Meetings----------#


  #---------Messages----------#
  match '/messages_index', :to => 'desktop_view#messages_index', :as => "messages_index"
  match '/desktop_message_focussed_new/:id/(:message)/(:all)', :to => "desktop_view#desktop_message_focussed_new", :as => "desktop_focussed_message"
  match '/messages_new', :to => "desktop_view#messages_new", :as => "messages_new"
  match '/messages_create', :to => "desktop_view#messages_create", :as => "messages_create"
  match '/messages_show/:id', :to => "desktop_view#messages_show", :as => "messages_show"
  match '/messages_edit/:id', :to => "desktop_view#messages_edit"
  match '/messages_accept/meeting/:id', :to => "desktop_view#messages_accept", :as => "messages_accept"
  #---------Messages----------#


  #----------Delegates and profile-------------#
  match '/delegates_search', :to => "desktop_view#delegates_search", :as => "delegates_search"
  match ':id/delegate_profile_index', :to => "desktop_view#delegate_profile_index", :as => "delegate_profile_index"
  match ':id/follow', :to => "desktop_view#desktop_following", :as => "desktop_following"
  match '/:id/desktop_edit_profile', :to => "desktop_view#desktop_edit_profile", :as => "desktop_edit_profile"
  match '/:id/desktop_update_profile', :to => "desktop_view#desktop_update_profile", :as => "desktop_update_profile"
  #----------Delegates and profile-------------#


  #----------Graffiti-------------#
  match '/desktop_graffiti', :to => "desktop_view#desktop_graffiti", :as => "desktop_graffiti"
  #----------Graffiti-------------#


  #----------Assets_Downloads-------------#
  match '/desktop_assets_download', :to => "desktop_view#desktop_assets_download", :as => 'desktop_assets_download'
  #----------Assets_Downloads-------------#


  #----------Spaekers-------------#
  match '/desktop_speaker', :to => "desktop_view#desktop_speaker", :as => 'desktop_speaker'
  #----------Speakers-------------#


  #----------Concierge_service-------------#
  match '/concierge_service_desktop', :to => "desktop_view#concierge_service_desktop", :as => "concierge_service_desktop"
  match '/order_services_desktop/:message', :to => "desktop_view#order_services_desktop", :as => "order_services_desktop"
  #----------Concierge_service-------------#


#----------Contact Us-------------#
  match '/contact_us_new', :to => "desktop_view#contact_us_new", :as => "contact_us_new"
  match '/contact_us_create', :to => "desktop_view#contact_us_create", :as => "contact_us_create"
  #----------Contact Us-------------#


#----------Questionables-------------#
  match '/desktop_ask_question', :to => "desktop_view#desktop_ask_question", :as => "desktop_ask_question"
  match '/desktop_questions_appending/:track_id', :to => "desktop_view#desktop_questions_appending", :as => "desktop_questions_appending"
  match '/desktop_create_question', :to => "desktop_view#desktop_create_question", :as => "desktop_create_question"
  #----------Questionables-------------#


  match '/trigger_recommend', :to => "home#trigger_recommend", :as => "trigger_recommend" #----------------for desktop------------------#
  match '/wait', :to => "home#wait", :as => "waiting_to_load" #----------------for desktop------------------#

















  #---------------------------------------
  #put "messages/:id" => "messages#show"

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.

  root :to => 'home#index'
  #root :to => "cms_content#render_html"
  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
