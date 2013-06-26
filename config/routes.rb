Heartmap::Application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'


	resources :users
	resources :user_sessions
	resources :languages
	resources :pages
	resources :roles
	resources :user_roles
	resources :settings
	
	match '/user_delete/:id' => 'users#destroy', :as => :user_delete
	match '/page_delete/:id' => 'pages#destroy', :as => :page_delete
	match '/language_delete/:id' => 'languages#destroy', :as => :language_delete
	match '/role_delete/:id' => 'roles#destroy', :as => :role_delete
	
	match 'logout' => 'user_sessions#destroy', :as => :logout

	resources :fronts
	
	match '/dashboard' => 'fronts#dashboard', :as => :dashboard
  match '/change_password' => 'fronts#change_password', :as => :change_password
  match '/fronts/other/:page_id' => 'fronts#other', :as => :other
  match '/forgot_password' => 'fronts#forgot_password', :as => :forgot_password

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

	root :to => 'fronts#dashboard'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
