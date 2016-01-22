Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:index, :show]
  root 'posts#index'
  resources :posts

  get 'my_friends', to: "users#my_friends"
end
