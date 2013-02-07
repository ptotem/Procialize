ProcializeApp::Application.routes.draw do


  get "ratings/index"

  get "speaker/index"

  get "moderator/moderator_view"

  get "moderator_view/moderator"

  #resources :questionables

  resources :invitees

  devise_for :users, :controllers => {:omniauth_callbacks => "users/omniauth_callbacks"}
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

  match '/followers_status', :to => "home#followers_status", :as => "followers_status"
  match '/accept/event/:id', :to => "events#accept", :as => "attend_event"
  match '/accept/meeting/:id', :to => "meetings#accept", :as => "accept_meeting"
  match '/decline/meeting/:id', :to => "meetings#decline", :as => "decline_meeting"
  match '/update_location', :to => "application#update_location", :as => "update_location"
  get 'search/search'
  match 'users/:id/edit', :to => "users/profile#edit", :as => "edit"
  match 'users/:id/update', :to => "users/profile#update", :as => "update"
  match '/messages/:id', :to => "messages#show"
  match '/create_questionables', :to => "questionables#create_question"
  match '/question_view', :to => "questionables#question_view",:as => "create_question"
  match '/hide_quest', :to => "questionables#hide_quest", :as => "hide_quest"
  match '/approve_quest', :to => "questionables#approve_quest", :as => "approve_quest"
  #match '/questionables/index', :to => "questionables#index"
  match '/questionables/index/(:id)', :to => "questionables#index"
  match '/unapproved_view', :to => "questionables#unapproved_view"
  match '/print/(:id)', :to => "questionables#print"
  match '/graffiti', :to => "home#graffiti"
  match '/speaker', :to => "speaker#index"
  match '/ask_question', :to => "questionables#ask_question"
  match '/ratings', :to => "ratings#index"
  match '/user_event', :to => "ratings#user_event", :as => "user_event"
  match '/rating_up', :to => "ratings#rating_up", :as => "rating_up"
  match "/send_mailers", :to=> "invitees#send_mailers"
  match "/search_delegates", :to => "search#search_delegates"

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

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
