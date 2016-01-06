Rails.application.routes.draw do
  get 'groups/new'

  get 'groups/create'

  get 'groups' => 'groups#index'

  post 'groups' => 'groups#create'

  get 'groups/:id' => 'groups#show'
  
  post 'groups/:id/update' => 'groups#update'

  post 'groups/delete/:id' => 'groups#destroy'

  post 'sessions/login' => 'sessions#login'

  get 'sessions/logout'

  get 'users/new'

  post 'users/create' => 'users#create'

  resources :groups
  get 'main' => 'users#new'
end
