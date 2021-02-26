Rails.application.routes.draw do
  resources :order_items
  resources :orders
  resources :items
  resources :users
  resources :sessions, only: [:create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

# resources :sessions, only: [:create, :new, :destroy]
# get '/signup', to: 'users#new'
# get '/logout', to: 'sessions#destroy'
# get '/login', to: 'sessions#new'