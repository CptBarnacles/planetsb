Rails.application.routes.draw do
  get 'nasa_api/index'
  resources :sponsors
  get 'sponsor', to: 'sponsors#index'
  get '/login', to:'sessions#new'
  post '/login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
  resources :users
  resources :planets
  root 'planets#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
