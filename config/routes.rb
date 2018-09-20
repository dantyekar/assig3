Rails.application.routes.draw do
  get  '/home',    to: 'welcome#home'
  get  '/about',   to: 'about#about'
  get  '/contacts', to: 'static_pages#contacts'
  get  '/service',   to: 'foods#index'
  get  '/blog', to: 'static_pages#blog'

  root 'welcome#home'

  resources :foods, :categories, :cart_items, :carts

  resources :users do
    resources :orders
  end

  namespace :administrator do
    resources :orders, :foods, :users, :categories
  end
  
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  post 'checkout' => 'checkout#show', as: :checkout
  get '/payment/processed' => 'checkout#create', as: :get_payment_completed
  post 'payment' => 'checkout#create', as: :payment
  post '/payment/processed' => 'checkout#create', as: :payment_completed

  post 'carts/checkout' => 'carts#checkout', as: :cart_checkout
  delete 'carts/:item_id/', to: 'carts#destroy', as: :cart_item_delete

  get 'administrator' => 'administrator#show', as: :dashboard

  patch 'order_status' => 'administrator/orders#update', as: :order_status

end
