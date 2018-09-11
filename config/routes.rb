Rails.application.routes.draw do
  # get 'static_pages/home'
  # get 'static_pages/about'
  # get 'static_pages/service'
  # get 'static_pages/blog'
  # get 'static_pages/contacts'
  get  '/home',    to: 'welcome#home'
  get  '/about',   to: 'about#about'
  get  '/contacts', to: 'static_pages#contacts'
  get  '/service',   to: 'foods#index'
  get  '/blog', to: 'static_pages#blog'
  # root 'static_pages#home'
  # # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'sales/new'

  root 'welcome#home'
  resources :foods do
    resources :comments
  end
  
  resources :categories
  resources :cart_items
  resources :carts
  resources :administrator
  resources :about
  resources :sales
  resources :users do
    resources :orders
  end
  
  get 'display/:option' => 'sales#display', as: 'display'
  get 'login' => 'sessions#new'
  get '/payment/processed' => 'checkout#create', as: :get_payment_completed
  get 'admin' => 'administrator#show', as: :dashboard
  get 'admin/foods' => 'administrator#food_index', as: :admin_foods
  get 'admin/orders' => 'administrator#order_index', as: :admin_orders
  get 'admin/users' => 'administrator#user_index', as: :admin_users
  get 'admin/sales' => 'administrator#sale_index', as: :admin_sales
  get 'admin/categories' => 'administrator#category_index',
      as: :admin_categories
  post 'login' => 'sessions#create'
  post 'checkout' => 'checkout#show', as: :checkout
  post 'carts/checkout' => 'carts#checkout', as: :cart_checkout
  post 'payment' => 'checkout#create', as: :payment
  post '/foods/:food_id/comments(.:format)' => 'comments#create',
       as: :create_food_comment
  post '/payment/processed' => 'checkout#create', as: :payment_completed
  patch 'order_status' => 'administrator#update', as: :order_status
  patch '/foods/:food_id/edit_status' => 'foods#edit_status', as: :edit_status
  delete 'logout' => 'sessions#destroy'
  delete 'carts/:item_id/', to: 'carts#destroy', as: :cart_item_delete

end
