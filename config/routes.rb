Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users do
        resources :snacks, only: :index, to: '/api/v1/users/snacks#index'
      end
      resources :snacks
      resources :users_snacks, only: [:create, :destroy]
      resources :reviews, only: [:create, :update, :destroy]
    end
  end
end
