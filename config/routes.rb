Rails.application.routes.draw do
  resources :places
  devise_for :users

  match '/users',     to: 'users#index',  via: 'get'
  match '/:username', to: 'users#show',   via: 'get', as: :profile
  
  root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
