Rails.application.routes.draw do
  root to: 'pages#home'

  devise_for :users

  resources :options, only: [:index]

  resources :trips, only: [:index, :show] do
    resources :options, only: [:create]
  end

  resources :reviews, only:  [:create]
end
