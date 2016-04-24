Rails.application.routes.draw do
  namespace :admin do
    resources :users
    root to: "users#index"
  end
  root to: 'visitors#index'
  devise_for :users
  resources :users
  resources :projects, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :proposals, only: [:new, :create]
  end
  resources :companies, only: [:new, :create, :show] do
    resources :reviews, only: [:index, :new, :create]
  end
  resources :dashboard, only: [:index]
  get 'projects/interested/:project_id', to: 'projects#interested'
end
