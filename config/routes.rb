Rails.application.routes.draw do
  get 'groups/new'

  get 'groups/create'

  get 'groups/show'

  get 'groups/destroy'

  get 'sessions/login'

  get 'sessions/logout'

  get 'users/new'

  get 'users/create'

  resources :groups
  get 'main' => 'users#new'
end
