# frozen_string_literal: true

Rails.application.routes.draw do
  resource :session, only: %i[new create destroy]
  resources :users, only: %i[new create edit update]

  resources :advertisements do
    resources :comments, except: %i[new show]
  end

  namespace :admin do
    resources :users, only: %i[index create edit update destroy]
  end

  root 'pages#index'
end
