Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'profile', to: 'pages#profile', as: :profile

  resources :vans do
    resources :bookings, only: [:index, :new, :create, :destroy]
  end
end
