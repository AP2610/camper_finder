Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'profile', to: 'pages#profile', as: :profile

  resources :van do
    resources :booking, only: [:index, :new, :create, :destroy]
  end
end
