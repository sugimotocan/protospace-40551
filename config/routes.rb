Rails.application.routes.draw do
  devise_for :users

  root to: "prototypes#index"

  resources :prototypes, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
    resources :comments, only: [:create, :destroy]  # comments をネスト
  end

  resources :rooms, only: [:new, :create] do
    resources :messages, only: [:index, :create]
  end

  resources :users, only: [:show, :edit, :update]
end