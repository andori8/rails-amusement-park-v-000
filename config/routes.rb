Rails.application.routes.draw do
  root 'welcome#home'

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/signout' => 'sessions#destroy'

  post '/rides/new' => 'rides#new'

  resources :users
  resources :attractions
end
