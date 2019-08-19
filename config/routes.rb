Rails.application.routes.draw do
  get 'vans/index'
  get 'vans/show'
  get 'vans/new'
  get 'vans/create'
  get 'vans/edit'
  get 'vans/update'
  get 'vans/destroy'
  devise_for :users
  root to: 'pages#home'

  resources :van do
    resources :booking, only: [:index, :new, :create, :destroy]
  end
end
