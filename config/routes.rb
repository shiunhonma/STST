
Rails.application.routes.draw do
  resources :room_entries
  get 'home/mypage'
  get 'home/index'
  root to: 'home#index'
  resources :chats
  resources :user_rooms
  resources :rooms
  resources :room_categories
  resources :users
  resources :room_entries
  resources :room_selects
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

  get '/image_of_usericon/:id', to: 'users#get_image', as:'image_of_usericon'

  get '/room_selects/show', to: 'room_selects#show'
end
