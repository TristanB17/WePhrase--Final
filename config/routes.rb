Rails.application.routes.draw do
  root to: 'home#show'

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'
  get '/dashboard', to: 'dashboard#show', as: :dashboard

  namespace :api do
    namespace :v1 do
      resources :languages, only: [:index, :show]
      namespace :languages do
        get '/:id/search/new', to: 'search_language#new'
        get '/:id/search', to: 'search_language#index'
        post '/:id/search', to: 'search_language#create'
      end
    end
  end

  resources :languages, only: [:index, :show]
  namespace :languages do
    get '/:id/search/new', to: 'search_language#new'
    get '/:id/search', to: 'search_language#index'
    post '/:id/search', to: 'search_language#create'
  end

  resources :sessions, only: [:create, :destroy]
  resources :home, only: [:show]
end
