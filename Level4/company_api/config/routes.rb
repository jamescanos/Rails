Rails.application.routes.draw do
  resources :roles
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :companies
  resources :roles
end