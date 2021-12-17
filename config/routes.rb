Rails.application.routes.draw do
  root "root#index"

  resources :shelters, only: [:index]
end
