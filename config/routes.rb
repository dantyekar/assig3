Rails.application.routes.draw do
  get  '/home',    to: 'welcome#home'
  get  '/about',   to: 'about#about'
  get  '/contacts', to: 'static_pages#contacts'
  get  '/service',   to: 'foods#index'
  get  '/blog', to: 'static_pages#blog'
  get '/order_items', to: 'carts#index'

  root 'welcome#home'

  resources :categories
  resources :foods
  resources :order_items
  resources :carts

  resources :users do
    resources :orders
  end

  namespace :administrator do
    resources :orders, :foods, :users, :categories
  end
  
  namespace :api do 
    namespace :v1 do 
      resources :foods
    end 
  end 
  
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  post 'checkout' => 'checkout#show', as: :checkout
  get '/payment/processed' => 'order#create', as: :get_payment_completed
  post 'payment' => 'order#create', as: :payment
  post '/payment/processed' => 'order#create', as: :payment_completed

  post 'carts/checkout' => 'carts#checkout', as: :cart_checkout

  get 'administrator' => 'administrator#show', as: :dashboard

  patch 'order_status' => 'administrator/orders#update', as: :order_status

end
