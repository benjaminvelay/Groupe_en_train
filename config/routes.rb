Rails.application.routes.draw do
  root to: 'pages#home', as: 'home'
  get "pages/about", to: "pages#about", as: "about"

  devise_for :users

  resources :bookings, only: [:index, :show, :create]
  resources :trips, only: [:index, :show]
  resources :reviews, only:  [:create]

  namespace :admin do
    resources :trips, only: [:index, :update]
  end
end
