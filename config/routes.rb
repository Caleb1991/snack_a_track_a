Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users
      resources :snacks
      resources :users_snacks, only: [:create, :destroy]
      resources :reviews, only: :create
    end
  end
end
