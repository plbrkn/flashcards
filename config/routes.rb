# frozen_string_literal: true

Rails.application.routes.draw do
  root 'cards#home'

  resources :card_check, only: :create
  resources :cards
  resources :users
end
