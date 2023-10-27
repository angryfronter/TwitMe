Rails.application.routes.draw do
  resources :advertisements

  root 'pages#index'
end
