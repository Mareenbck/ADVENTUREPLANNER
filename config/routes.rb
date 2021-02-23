Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :trips, only: [:index, :show] do
    resources :bookings, only: [:create]
  end

  resources :bookings, only: [:show, :destroy] do
    resources :reviews, only: [:create]
  end

  resources :chatrooms, only: [:index] do
    resources :messages, only: [:create]
  end

  resource :dashboard, only: [:show]

end
