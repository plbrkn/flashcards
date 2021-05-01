# frozen_string_literal: true

Rails.application.routes.draw do
  root 'wellcome#wellcome'

  resources :cards
end
