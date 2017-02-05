Rails.application.routes.draw do

  resources :products, only: [:index, :show]

  get "home/welcome"
  root 'home#welcome'

end
