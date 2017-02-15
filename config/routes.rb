Rails.application.routes.draw do

  devise_for :users

  resources :carts do
    resources :orders, only: [:destroy]
    member do
      post :checkout
    end
  end

  resources :products do
    resources :pics, only: [:show, :create, :destroy]
    member do
      get :add_to_cart
    end
  end

  resources :categories, only: [:index, :new, :create,:show]
  resources :subscribers

  get "home/welcome"
  root 'home#welcome'
end
