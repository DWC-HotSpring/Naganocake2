Rails.application.routes.draw do
  namespace :admins do
    get 'homes/top'
    resources :customers, only: [:index, :edit, :show, :update]
    resources :products, only: [:index, :edit, :show, :update, :new, :create]
    resources :genres, only: [:index, :edit, :update, :create]
    resources :orders, only: [:index, :show, :update]
  end
  devise_for :admins
  
  #顧客用サイトのルーティング
  devise_for :customers

  resources :products, only: [:index, :show]


  resources :orders, only: [:new, :index, :create, :show]
    get 'orders/confirm' => 'orders#confirm'
    get 'orders/thanks' => 'orders#thanks'
  resources :order_products, only: [:new, :create, :index, :show]
  resources :cart_items, only: [:index, :create, :update, :destroy] do
    collection do
      delete 'destroy_all'
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
