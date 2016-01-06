Rails.application.routes.draw do

  get 'groups' => 'groups#index'

  post 'groups' => 'groups#create'

  get 'groups/:id' => 'groups#show'
  
  post 'groups/:id/update' => 'groups#update'

  post 'groups/delete/:id' => 'groups#destroy'

  post 'sessions/login' => 'sessions#login'

  get 'logout' => 'sessions#logout'

  post 'users/create' => 'users#create'

  get 'main' => 'users#new'
  
end
