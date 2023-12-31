# frozen_string_literal: true

Rails.application.routes.draw do
  resource :session, only: %i[new create destroy]
  resources :users, only: %i[new create edit update show]

  resources :advertisements do
    resources :comments, except: %i[new show]
  end

  resource :password_reset, only: %i[new create edit update]

  get '/all_users', to: 'users#all_users', as: 'all_users'

  namespace :admin do
    resources :users, only: %i[index create edit update destroy]
  end



  root 'pages#index'
end
