# frozen_string_literal: true

Rails.application.routes.draw do
  root 'cards#home'

  post 'check' => 'cards#check'

  resources :cards
end
