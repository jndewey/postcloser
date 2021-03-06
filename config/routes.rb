Postcloser::Application.routes.draw do


  resources :closing_items
  resources :tasks

  get "profiles/show"
  get "closing_items/new"
  post "closing_items/new"
  post "closings/current_closing"
  get "closings/show"
  post "closings/show"
  get "closings/show_open"
  post "closings/show_open"

  get "tasks/mytasks"
  post "tasks/mytasks"
  get "tasks/new"
  post "tasks/new"



  get "closing_items/show"

  match "closings/show" => "closings#show"
  match "closings/send_text" => "closings#send_text", as: :send_text
   match "closings/send_mail" => "closings#send_mail", as: :send_mail


  devise_for :users


  devise_scope :user do
    get 'register', to: 'devise/registrations#new', as: :register 
     get 'login', to: 'devise/sessions#new', as: :login 
       get 'logout', to: 'devise/sessions#destroy', as: :logout 
  end

  resources :closings


  get 'feed', to: 'closings#index', as: :feed
  root to: 'closings#index'

  get '/:id', to: 'profiles#show'
 


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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
