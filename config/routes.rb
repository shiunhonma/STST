Rails.application.routes.draw do
  resources :cahts
  resources :user_rooms
  resources :rooms
  resources :room_categories
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/signup', to: 'user#new'
  post '/signup', to: 'user#create'
  get '/users/:id', to: 'user#show', as: 'profile'
  delete '/users/:id', to: 'users#destroy', as: 'unsubscribe'
end
