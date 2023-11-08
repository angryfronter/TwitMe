Rails.application.routes.draw do
  resources :advertisements, only: %i[index new edit create update]

  root 'pages#index'
end
