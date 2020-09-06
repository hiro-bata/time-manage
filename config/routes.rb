Rails.application.routes.draw do

  root to: "toppages#index"
  
  resources :users, only: [:new, :create]
  resources :tasks, only: [:index, :new, :create, :destroy]
end
