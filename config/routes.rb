Rails.application.routes.draw do
  namespace :admin do
    resources :users
    root to: "users#index"
  end
  root to: 'visitors#index'
  devise_for :users
  resources :users
  resources :projects, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  resources :companies, only: [:new, :create]
end
