Rails.application.routes.draw do
  resources :movies do
    collection do
        get 'search'
    end
  end
  post '/watch-movie', to: 'movies#watch'
  post '/unwatch-movie', to: 'movies#unwatch'
  root 'movies#index'
end
