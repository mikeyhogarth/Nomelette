Nomelette::Application.routes.draw do

  root :to => 'home#index'

  #named routes
  match "about" => 'home#about'   , :as => :about
  match "contact" => 'home#contact' , :as => :contact
  match 'login' => 'sessions#new', :as => :login
  match 'admin/login' => 'sessions#new_admin', :as => :admin_login
  match 'logout' => 'sessions#destroy', :as => :logout
  match 'authenticate' => 'sessions#create', :as => :authenticate

  #public REST routes
  get "recipes/tagged_with(/:tag)" => "recipes#tagged_with", :as => :tagged_with
  resources :recipes, :only => [:index, :show]
  resources :categories, :only => [:show, :index]
  resources :category_types, :only => [:index]



  #Admin area
  namespace :admin do
    root :to => "home#index" 
    
    resources :recipes
    resources :categories
    resources :category_types
    resources :users    
  end

  #provider authentication
  match "/auth/:provider/callback" => "sessions#create"

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
