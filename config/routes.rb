# frozen_string_literal: true

Rails.application.routes.draw do
  root 'cards#home'

  resources :card_check, only: :create
  resources :cards
  resources :users

  resources :user_sessions, only: %i[new create destroy]

  get 'login' => 'user_sessions#new', as: :login
  delete 'logout' => 'user_sessions#destroy', as: :logout
end
