Rails.application.routes.draw do
  root to: 'welcome#index'
  namespace :api do
    namespace :v1 do
      get '/forecast', to: 'weather#index'
      get '/backgrounds', to: 'backgrounds#index'
      post '/users', to: 'users#create'
      post '/sessions', to: 'sessions#create'
      post '/road_trip', to: 'roadtrips#create'
    end
  end
end
