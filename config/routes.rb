Rails.application.routes.draw do
  root "pages#home"
  get 'about', to: 'pages#about'

  devise_for :users
  resources :products, only: [:index, :show]

  resource :cart, only: [:show], controller: 'cart' do
    post "add/:product_id", to: "cart#add_item", as: :add_item
    delete "remove/:product_id", to: "cart#remove_item", as: :remove_item
    patch "update/:product_id", to: "cart#update_quantity", as: :update_quantity
  end

  resources :orders, only: [:index, :show, :create] do
    collection do
      get :checkout
      get :shipping
      get :payment
      post :process_payment
      get :confirmation
    end
  end

  namespace :admin do
    resources :products
    resources :orders
  end
end
