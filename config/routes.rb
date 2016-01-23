Rails.application.routes.draw do
  root             "pages#home"
  get "about", to: "pages#about"

  devise_for :users
  resources :users, only: [:index, :show]
  resources :friendships
  resources :posts

  get 'my_friends', to: "users#my_friends"
  get 'search_friends', to: "users#search"
  post 'add_friend', to: "users#add_friend"
end
