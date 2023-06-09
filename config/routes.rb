Rails.application.routes.draw do
  root 'home#index'

  get 'users/new', to: 'users#new', as: :new_user
  post 'users', to: 'users#create'
  get '/users/dashboard', to: 'users#dashboard'
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
