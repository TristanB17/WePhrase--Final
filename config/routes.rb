Rails.application.routes.draw do
  root to: 'home#show'

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'
  get '/dashboard', to: 'dashboard#show', as: :dashboard

  resources :languages, only: [:index, :show]
  namespace :languages do
    get '/:id/new', to: 'search_language#new'
    get '/:id/search', to: 'search_language#index'
  end

  resources :sessions, only: [:create, :destroy]
  resources :home, only: [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
