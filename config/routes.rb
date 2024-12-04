Rails.application.routes.draw do
  get 'province/name'
  get 'user/index'
  devise_for :customers
  devise_for :users
  get 'cart/add_to_cart'
  get 'cart/remove_from_cart'
  get 'cart/update_cart'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'search/index'
  get 'categories/index'
  get 'categories/list'
  get 'products/index'
  get 'products/show'
  get 'products/cart'
  post 'carts/add_item'
  post 'carts/remove_item'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  root 'home#index'
  get '/Products/index', to:'products#index'
  get '/Products/show', to:'products#show'
  get '/Products/cart', to:'cart#show'
  get '/Products/cartRemove', to:'products#cartRemove'
  get '/Categories/index', to:'categories#index'
  get '/Categories/list', to:'categories#list'
  get '/Search/result', to:'search#index'
  get '/account', to:'user#index'
  get '/Contact', to:'home#show'
  patch '/update', to: 'user#update', as: 'update'
  get '/users/sign_out', to:'user#sign_out'
  post '/purchase', to: 'invoice#index', as: 'purchase'

  # post '/add_to_cart', to: 'cart#add_to_cart'
  get '/view_cart', to: 'cart#view_cart'
  delete '/remove_from_cart/:id', to: 'cart#remove_from_cart', as: 'remove_from_cart'
  post '/add_to_cart', to: 'cart#add_to_cart', as: 'add_to_cart'
  patch '/update_cart/:id', to: 'cart#update_cart', as: 'update_cart'
end
