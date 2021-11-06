Rails.application.routes.draw do
  get 'users/info', to: 'users#info'
  post '/users/charge', to: 'users#charge'
  get '/users/cancel_subscription', to: 'users#cancel_subscription'

  root to: 'home#index'
  devise_for :users
  resources :publications, only: [:index,:show]
  namespace :admin do
    resources :publications
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
