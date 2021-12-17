Rails.application.routes.draw do
  root "root#index"

  resources :shelters, only: [:index]
  resources :pets, only: [:index]
end
