Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: "registrations",
                                      sessions: "sessions" }
  post 'beers/:id/add_comment', to: 'beers#add_comment', as: 'beers_new_comment'
  get '/beers/search', to: 'beers#search', as: 'beers_search'
  get '/beers', to: 'beers#list', as: 'beers_list'
  resources :beers, only: [:create, :update, :show]

  post 'bars/:id/add_comment', to: 'bars#add_comment', as: 'bars_new_comment'
  get '/bars/search', to: 'bars#search', as: 'bars_search'
  get '/bars', to: 'bars#list', as: 'bars_list'
  resources :bars, only: [:create, :update, :show]
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
