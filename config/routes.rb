Rails.application.routes.draw do
  root 'sessions#home'
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  
  get '/login' => 'sessions#new'
  post '/login' => "sessions#create"
  delete 'logout' => 'sessions#destroy'
  get '/edit' => "inventory_lists#update"
  get '/auth/:provider/callback' => 'sessions#omniauth'


  resources :comments 
  resources :users do 
    resources :inventory_lists
  end
  resources :inventory_lists do 
    resources :comments
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
