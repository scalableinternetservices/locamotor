Rails.application.routes.draw do
  devise_for :users
  resources :posts

  resources :users

  root 'main#home'

  get 'users/new'
  get 'posts/new'
  get  '/signup',  to: 'users#new'
  get 'main/home'
  get 'main/help'
  get 'main/about'
  get 'search', to: 'main#search'
  get 'search/results', to: 'main#results'
  get '/posts/:id', to: 'posts#show'
  patch '/posts/:id/claim', to: 'posts#claim'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #root 'application#home'
end
