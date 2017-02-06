Rails.application.routes.draw do

  devise_for :users, :controllers => {sessions: 'sessions', registrations: 'registrations'}
  resources :products

  get "home/welcome"
  root 'home#welcome'

end
