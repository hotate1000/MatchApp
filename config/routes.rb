Rails.application.routes.draw do
  devise_for :users
  root to: 'users#index';
  resources :posts, only: [:index];
  resources :users, only: [:index, :show]
  # get 'users/index'
  # get 'users/show'
end
