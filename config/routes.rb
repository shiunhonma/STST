Rails.application.routes.draw do
  resources :chats
  resources :user_rooms
  resources :rooms
  resources :room_categories
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
