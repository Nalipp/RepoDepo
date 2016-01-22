Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:index, :show]
  root 'posts#index'
  resources :posts
end
