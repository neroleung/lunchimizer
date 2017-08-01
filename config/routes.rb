Rails.application.routes.draw do
  root to: 'home#index'

  resources :users, only: [:new]

  namespace :api, defaults: { format: :json } do
    resources :users, only: [:create]
  end
end
