Rails.application.routes.draw do

  resources :users
  resources :tweets, only: [:index, :show, :new, :create, :destroy]
  resources :likes
  
  get "/", to: "homepage#home", as: "homepage" #show page 
  get "/login", to: "sessions#login" #new 
  post "/login", to: "sessions#process_login" #create

  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
