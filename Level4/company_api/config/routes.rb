Rails.application.routes.draw do

  resources :employees
  resources :projects
  resources :clients
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :companies
  resources :roles
  resources :countries
end
