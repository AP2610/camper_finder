Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'profile', to: 'pages#profile', as: :profile
  get 'bookings', to: 'bookings#list', as: :bookings_list

  resources :vans do
    resources :bookings, only: [:new, :create]
  end

  resources :bookings, only: :destroy
end
