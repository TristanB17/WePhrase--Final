Rails.application.routes.draw do
  root to: 'home#show'

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'
  get '/dashboard', to: 'dashboard#show', as: :dashboard

  resources :languages, only: [:index, :show, :new, :create]
  namespace :languages do
    get '/:id/search/new', to: 'search_language#new'
    get '/:id/search', to: 'search_language#index'
    post '/:id/search', to: 'search_language#create'
  end

  resources :translations do
    member do
      put "like" => "translations#upvote"
    end
  end
  resources :sessions, only: [:create, :destroy]
  resources :home, only: [:show]
end
