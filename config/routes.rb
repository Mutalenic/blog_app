Rails.application.routes.draw do
  devise_for :users
  get 'likes/new'
  get 'comments/new'
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :create, :new, :show, :destory] do
      resources :comments, only: [:create, :new, :destory]
      resources :likes, only: [:create, :new]
    end
  end
  root 'users#index'
end
