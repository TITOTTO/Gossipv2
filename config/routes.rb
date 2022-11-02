Rails.application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]
  resources :likes, only: [:create, :destroy]

  resources :comments
  
  resources :gossip
  resources :users do
    resources :gossip
  end
  resources :city
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
