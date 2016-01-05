Rails.application.routes.draw do
  get 'groups/new'

  get 'groups/create'

  get 'groups' => 'groups#index'

  get 'groups/destroy'

  post 'sessions/login'

  get 'sessions/logout'

  get 'users/new'

  post 'users/create' => 'users#create'

  resources :groups
  get 'main' => 'users#new'
end
