Rails.application.routes.draw do
  resources :memberships, only: [:index, :create]
  resources :clients, only: [:index, :show, :create, :update]
  resources :gyms
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
