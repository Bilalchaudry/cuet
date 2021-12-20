Rails.application.routes.draw do
  post 'orders/create/:id', to: 'orders#create'
  get 'orders/update'
  get 'orders/place_order'
  get 'back', to: 'application#back'
  devise_for :clients
  get 'cart/show'
  get 'cart/show_cart/:id', to: 'cart#show_cart', as: 'show_cart'
  get 'cart/index'
  post 'cart/update'
  delete 'cart/:id/cart_product/:p_id', to: 'cart#delete', as: 'delete_cart_product'
  get 'products/index'
  get '/products/show/:id', to: 'products#show'
  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root 'shops#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
