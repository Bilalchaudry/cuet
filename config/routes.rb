Rails.application.routes.draw do
  # get 'reviews/new'
  # get 'reviews/create'
  # get 'reviews/index'
  # get '/sitemap', to: 'testsuite#sitemap'
  # get '/sitemap', to: 'testsuite#sitemap'
  get 'blogs/index'
  get 'blogs/show/:id', to: 'blogs#show'
  post 'orders/create/:id', to: 'orders#create'
  get 'orders/update'
  get 'orders/place_order'
  post 'cart/add_to_cart/:id', to: 'cart#add_to_cart'
  get 'back', to: 'application#back'
  devise_for :clients
  get 'cart/show'
  get 'cart/show_cart/:id', to: 'cart#show_cart', as: 'show_cart'
  get 'cart/index'
  post 'cart/update'
  delete 'cart/:id/cart_product', to: 'cart#delete', as: 'delete_cart_product'
  get 'products/index'
  get '/product/:id', to: 'products#show', as: 'product_show'
  get '/order/:id', to: 'orders#show', as: 'order_show'
  get '/all_orders', to: 'orders#client_orders', as: 'all_orders'
  get '/order_pdf', to: 'orders#get_pdf'
  # get '/shoping', to: 'shops#index'
  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root 'shops#index'
  get ':id', to: 'products#product_type_products', as: 'product_type_products'

  #Reviews
  get '/review/new', to: 'reviews#new'
  post 'review/create', to: 'reviews#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
