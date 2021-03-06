Rails.application.routes.draw do

  #管理者用ルーティング
  namespace :admins do
    get '/top' => "homes#top"
    resources :customers, only: [:index, :edit, :show, :update]
    resources :products, only: [:index, :edit, :show, :update, :new, :create]
    resources :genres, only: [:index, :edit, :update, :create]
    resources :orders, only: [:index, :show, :update]
    resources :order_products, only: [:update]
    get "search" => "searches#search"
  end
  devise_for :admins

  # rootパス
  root 'homes#top'

  #顧客用サイトのルーティング
  devise_for :customers

  get 'homes/top' => 'homes#top', as: 'customer_top'
  get 'homes/about' => 'homes#about', as: 'customer_about'

  resources :addresses, only: [:index, :edit, :create, :update, :destroy]

  resources :customers, only: [:edit, :show, :update] do
    member do
      get :withdraw
      put :withdraw_done
    end
  end
  
  resources :products, only: [:index, :show] do
    collection do
      #ジャンル検索用に追加
      post 'search'
    end
    resources :posts, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  resources :orders, only: [:new, :index, :create, :show]
    post 'orders/confirm' => 'orders#confirm'
    get 'orders/thanks' => 'orders#thanks'
  resources :order_products, only: [:new, :create, :index, :show]
  resources :cart_items, only: [:index, :create, :update, :destroy] do
    collection do
      delete 'destroy_all'
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
