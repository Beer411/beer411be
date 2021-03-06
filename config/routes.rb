Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: "registrations",
                                      sessions: "sessions" }
  get '/bug_report', to: 'users#bug_report', as: 'bug_report'
  post 'bug_submit', to: 'users#submit', as: 'bug_submit'

  get '/beers/search', to: 'beers#search', as: 'beers_search'
  put 'beers/:id/add_bar', to: 'beers#add_bar', as: 'beers_new_bar'
  get 'beers/:id/comments', to: 'beers#comment', as: 'beers_comment'
  post 'beers/:id/add_comment', to: 'beers#add_comment', as: 'beers_new_comment'
  get '/beers', to: 'beers#list', as: 'beers_list'
  resources :beers, only: [:create, :update, :show]

  get '/bars/search', to: 'bars#search', as: 'bars_search'
  put 'bars/:id/add_beer', to: 'bars#add_beer', as: 'bars_new_beer'
  get 'bars/:id/comments', to: 'bars#comment', as: 'bars_comment'
  post 'bars/:id/add_comment', to: 'bars#add_comment', as: 'bars_new_comment'
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
