Rails.application.routes.draw do
  root "root#index"

  resources :shelters, only: [:index] do
    scope module: 'shelters' do
      resources :pets, only: [:index]
    end
  end

  resources :pets, only: [:index]

  match '*path', to: 'root#not_found', via: :all
end
