Rails.application.routes.draw do
  get 'groups/new'

  get 'groups/create'

  get 'groups' => 'groups#index'

  post 'groups' => 'groups#create'

  delete 'groups/destroy'

  post 'sessions/login' => 'sessions#login'

  get 'sessions/logout'

  get 'users/new'

  post 'users/create' => 'users#create'

  resources :groups
  get 'main' => 'users#new'
end
