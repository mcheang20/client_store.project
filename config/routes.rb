Rails.application.routes.draw do

  devise_for :users
  resources :carts
  resources :products do
    member do
      get :add_to_cart
    end
  end

  get "home/welcome"
  root 'home#welcome'

end
