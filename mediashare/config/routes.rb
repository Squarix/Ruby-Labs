# frozen_string_literal: true

Rails.application.routes.draw do
  resources :posts
  resources :tags, only: [:show]
  resources :categories, only: [:show]
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'

  namespace :admin do
    resources :categories, except: [:show]
  end
end
