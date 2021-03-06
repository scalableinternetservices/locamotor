Rails.application.routes.draw do
  devise_for :users
  resources :posts

  resources :users
  resources :photos
  resources :route_requests

  resources :conversations, only: [:index, :create] do
    resources :messages, only: [:index, :create]
  end

  root 'main#home'

  post 'ratings', to: 'ratings#new'
  get 'users/new'
  get 'posts/new'
  get 'routerequests/new', to: 'routes#new'
  post 'routerequests/create', to: 'routes#create'
  get '/signup',  to: 'users#new'
  get 'main/home'
  get 'main/help'
  get 'main/about'
  get 'search', to: 'main#search'
  get 'search/results', to: 'main#results'
  get 'search/all', to: 'main#all_posts'
  get '/posts/:id', to: 'posts#show'
  patch '/posts/:id/claim', to: 'posts#claim'
  patch '/reservations/:id/approval', to: 'reservations#approval'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #root 'application#home'
end
