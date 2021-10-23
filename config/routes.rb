Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :users
  resources :publications, only: [:index,:show]
  namespace :admin do
    resources :publications
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
