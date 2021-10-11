Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users do
        get '/snacks/top_five', to: '/api/v1/users/snacks#top_five'
        resources :snacks, only: :index, to: '/api/v1/users/snacks#index' do
        end

      end
      resources :snacks
      resources :users_snacks, only: [:create, :destroy]
      resources :reviews, only: [:create, :update, :destroy]
    end
  end
end
