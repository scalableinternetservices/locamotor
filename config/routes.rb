Rails.application.routes.draw do
  get 'posts/new'
  get 'posts/create'
  post 'posts/create'

  get 'users/new'

  root 'main#home'

  get 'main/home'
  get 'main/help'
  get 'main/about'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #root 'application#home'
end
