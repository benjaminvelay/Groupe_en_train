Rails.application.routes.draw do
  root to: 'pages#home', as: 'home'
  get "pages/about", to: "pages#about", as: "about"

  devise_for :users

  resources :bookings, only: [:index]

  resources :trips, only: [:index, :show] do
    resources :bookings, only: [:show, :create], shallow: true do
       resources :payments, only: [:new, :create], shallow: true
    end
  end
  resources :reviews, only:  [:create]

  namespace :admin do
    resources :trips, only: [:index, :update]
  end
end
