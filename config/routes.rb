Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  root 'searches#index'

  # Routes for the Carrier resource:
  # CREATE
  # get "/carriers/new", :controller => "carriers", :action => "new"
  # post "/create_carrier", :controller => "carriers", :action => "create"

  # # READ
  # get "/carriers", :controller => "carriers", :action => "index"
  # get "/carriers/:id", :controller => "carriers", :action => "show"

  # # UPDATE
  # get "/carriers/:id/edit", :controller => "carriers", :action => "edit"
  # post "/update_carrier/:id", :controller => "carriers", :action => "update"

  # # DELETE
  # get "/delete_carrier/:id", :controller => "carriers", :action => "destroy"
  #------------------------------

  # Routes for the Destination resource:
  # CREATE
  # get "/destinations/new", :controller => "destinations", :action => "new"
  # post "/create_destination", :controller => "destinations", :action => "create"

  # # READ
  # get "/destinations", :controller => "destinations", :action => "index"
  # get "/destinations/:id", :controller => "destinations", :action => "show"

  # # UPDATE
  # get "/destinations/:id/edit", :controller => "destinations", :action => "edit"
  # post "/update_destination/:id", :controller => "destinations", :action => "update"

  # # DELETE
  # get "/delete_destination/:id", :controller => "destinations", :action => "destroy"
  #------------------------------

  # Routes for the Favorite resource:
  # CREATE
  get "/favorites/new", :controller => "favorites", :action => "new"
  post "/create_favorite", :controller => "favorites", :action => "create"

  # READ
  get "/favorites", :controller => "favorites", :action => "index"
  get "/favorites/:id", :controller => "favorites", :action => "show"

  # UPDATE
  get "/favorites/:id/edit", :controller => "favorites", :action => "edit"
  post "/update_favorite/:id", :controller => "favorites", :action => "update"

  # DELETE
  get "/delete_favorite/:id", :controller => "favorites", :action => "destroy"
  #------------------------------

  # Routes for the Search resource:
  # CREATE
  get "/searches/new", :controller => "searches", :action => "new"
  post "/create_search", :controller => "searches", :action => "create"

  # READ
  get "/searches", :controller => "searches", :action => "index"
  get "/searches/:id", :controller => "searches", :action => "show"

  # UPDATE
  get "/searches/:id/edit", :controller => "searches", :action => "edit"
  post "/update_search/:id", :controller => "searches", :action => "update"

  # DELETE
  get "/delete_search/:id", :controller => "searches", :action => "destroy"
  #------------------------------

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
