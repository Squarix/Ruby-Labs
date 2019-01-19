# frozen_string_literal: true

Rails.application.routes.draw do
  get 'autocomplete', controller: :posts
  resources :posts
  resources :tags, only: [:show]
  resources :categories, only: [:show]
  resources :search, only: [:index]
  devise_for :users
  resources :comments do
    resources :comments
  end
  resources :posts do
    resources :comments
  end
  resources :home
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admin do
    resources :categories, except: [:show]
  end

  root 'home#index'
end
