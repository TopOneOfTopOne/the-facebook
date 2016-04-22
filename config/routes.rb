Rails.application.routes.draw do
  root to: 'pages#home'

  get 'friendships/create'

  get 'friendships/destroy'

  get 'users/external_create'

  devise_for :users, controllers: { registrations: "my_registrations" }

  get 'auth/:provider/callback', to: 'users#external_create'

  get '/profile/:id' => 'users#show', as: 'profile'

  resources :posts do
    resources :likes
  end

  resources :comments

  resources :friendships

end
