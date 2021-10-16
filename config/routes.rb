Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :sessions, only: :create
      resources :users do
        get '/snacks/users_top_rated_snacks', to: '/api/v1/users/snacks#users_top_rated_snacks'
        get '/snacks/snack_recommendations', to: '/api/v1/users/snacks#snack_recommendations'
        resources :snacks, only: :index, to: '/api/v1/users/snacks#index' do
        end

      end
      get '/snacks/top_rated_snacks_overall', to: '/api/v1/snacks#top_rated_snacks_overall'
      get '/snacks/top_rated_savory_or_sweet_snacks', to: '/api/v1/snacks#top_rated_savory_or_sweet_snacks'
      get '/snacks/all_savory_or_sweet_snacks', to: '/api/v1/snacks#all_savory_or_sweet_snacks'
      get '/snacks/:snack_id/average_rating', to: '/api/v1/snacks#average_rating'
      get '/snacks/:snack_id/reviews', to: '/api/v1/snacks/reviews#index'
      resources :snacks
      resources :users_snacks, only: [:create, :destroy]
      resources :reviews, only: [:create, :update, :destroy]
    end
  end
end
