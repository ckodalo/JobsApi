Rails.application.routes.draw do

  
  #post "/signup", to: "users#create"
  get "/me", to: "users#show"
  post "/submit", to: "sessions#create"
  post "/submit/new", to: "users#create"
  delete "/logout", to: "sessions#destroy"
  get "/listings", to: "jobs#listings"
  #delete "/logout", to: "sessions#destroy"
  # get "/auth", to: "users#show"
  resources :users
  resources :jobs
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
