Rails.application.routes.draw do
  root "root#index"

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/register', to: 'users#new'
  get '/profile', to: 'users#show'

  resources :users, only: [:create] do
    scope module: 'users' do
      resources :applications, only: [:index]
    end
  end

  resources :shelters, only: [:index] do
    scope module: 'shelters' do
      resources :pets, only: [:index]
    end
  end

  resources :pets, only: [:index, :show]

  match '*path', to: 'root#not_found', via: :all
end
