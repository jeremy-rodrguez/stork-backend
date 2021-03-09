Rails.application.routes.draw do
  post '/destroy_favorite', to: 'favorites#destroy'
  
  resources :favorites
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create]
      post '/login', to: 'auth#create'
      post '/sign_up', to: 'users#create'
      get '/profile', to: 'users#profile'
      get '/logout', to: 'users#destroy'

    end
    get '/items' => 'items#index'
    get '/items/:id' => 'items#show'
    # get '/favorites' => 'favorites#index'

  end

  resources :order_items
  resources :orders
  resources :items
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end