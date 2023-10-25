
Rails.application.routes.draw do
  get 'home/mypage'
  get 'home/index'
  root to: 'home#index'
  resources :chats
  resources :user_rooms
  resources :rooms
  resources :room_categories
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  get '/profile', to: 'users#show'
  delete '/unsubscribe', to: 'users#destroy'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/users/new', to: 'users#new'
  get '/users', to: 'users#index'

end
