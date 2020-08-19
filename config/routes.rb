Rails.application.routes.draw do

  get 'users/:id/followees', to: "users#followees", as: "followee"
  get 'users/:id/followers', to: "users#followers", as: "follower"
  
  post 'users/:id', to: "users#follow", as: "follow"
  delete 'users/:id', to: "users#unfollow", as: "unfollow"

  resources :users
  resources :tweets, only: [:index, :show, :new, :create, :destroy]
  resources :likes
  
  get "/", to: "homepage#home", as: "homepage" #show page 
  get "/login", to: "sessions#login" #new 
  post "/login", to: "sessions#process_login" #create
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
