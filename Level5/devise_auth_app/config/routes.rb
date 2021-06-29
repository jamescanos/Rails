Rails.application.routes.draw do
  
  devise_for :users, controllers: { registrations: 'registrations' }
  resources :employees
  resources :projects
  resources :clients
  resources :companies
  resources :roles
  resources :countries
  namespace :api do
    namespace :v1 do
      get 'post/index'
      post :auth, to: 'authentication#create'
      get  '/auth' => 'authentication#fetch'
    end
namespace :v2 do
      # Things yet to come
    end
  end
end
