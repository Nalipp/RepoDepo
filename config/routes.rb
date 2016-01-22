Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:index, :show]
  resources :friendships
  root 'posts#index'
  resources :posts

  get 'my_friends', to: "users#my_friends"
  get 'search_friends', to: "users#search"
  post 'add_friend', to: "users#add_friend"
end
