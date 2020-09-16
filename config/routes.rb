Rails.application.routes.draw do
  devise_for :users

# routes.rbでrootパスの先を設定する
# 今回はusers,controllersで指定
  # devise_scope :user do
  #   authenticated :user do
  #     root to: 'users#index', as: :authenticated_root
  #   end
  #   unauthenticated :user do
  #     root to: "devise/sessions#new", as: :unauthenticated_root
  #   end
  # end
  root to: 'users#index';
  resources :posts, only: [:index];
  resources :users, only: [:index, :show] do
    # collection do
    member do
      get 'followerPage'
      get 'followedPage'
    end
  end


  # いいね機能用のルーティング
  # resources :users do
  #   member do
  #    get :following, :followers
  #   end
  # end
  # resources :relationships, only: [:create, :destroy]

  post 'follow/:id' => 'relationships#follow', as: 'follow' # フォローする
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow' # フォロー外す
end
