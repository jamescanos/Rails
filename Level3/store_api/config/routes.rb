Rails.application.routes.draw do

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  #resources :companies, only: [:index, :show, :create, :update, :destroy]
  resources :companies
  resources :platforms
  resources :categories
  resources :books
  resources :games
end
