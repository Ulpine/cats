Rails.application.routes.draw do
  root 'pages#home'

  devise_for :users

  resources :products, only: [:index, :show]

  resources :orders, only: [:index, :show, :create]

  resource :cart, only: [:show] do
    post 'add/:product_id', to: 'cart#add_item', as: :add_item
    delete 'remove/:product_id', to: 'cart#remove_item', as: :remove_item
  end

  # Route admin si besoin
  namespace :admin do
    resources :products
    resources :orders
  end
end
