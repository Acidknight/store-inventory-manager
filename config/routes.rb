Rails.application.routes.draw do
  resources :comments
  resources :items
  resources :inventory_lists
  root 'sessions#home'
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  
  get '/login' => 'sessions#new'
  post '/login' => "sessions#create"
  delete 'logout' => 'sessions#destroy'
  resources :users

  resources :inventory_lists do
    resources :items, only: [:new, :create, :index]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
