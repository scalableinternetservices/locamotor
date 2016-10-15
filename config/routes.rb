Rails.application.routes.draw do
  resources :posts

  resources :users

  root 'main#home'

  get 'main/home'
  get 'main/help'
  get 'main/about'
  get '/posts/:id', to: 'posts#show'
  patch '/posts/:id/claim', to: 'posts#claim'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #root 'application#home'
end
