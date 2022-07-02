Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  devise_for :users
  get 'likes/new'
  get 'comments/new'
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :create, :new, :show, :destroy] do
      resources :comments, only: [:create, :new, :destroy]
      resources :likes, only: [:create, :new]
    end
  end

  namespace :api do
    resources :users, only: [:index, :show] do
      resources :posts, only: [:index, :create, :new, :show, :destroy] do
        resources :comments, only: [:create, :new, :destroy]
        resources :likes, only: [:create, :new]
      end
    end
  end
  root 'users#index'
end
