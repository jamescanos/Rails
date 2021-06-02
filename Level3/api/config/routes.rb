Rails.application.routes.draw do
  resources :secret_menu_items
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :secret_menu_items, only: [:index, :show, :create, :update, :destroy]

end
