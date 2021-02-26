Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create]
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
    end
  end

  resources :order_items
  resources :orders
  resources :items
  # resources :users
  resources :sessions, only: [:create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

# resources :sessions, only: [:create, :new, :destroy]
# get '/signup', to: 'users#new'
# get '/logout', to: 'sessions#destroy'
# get '/login', to: 'sessions#new'