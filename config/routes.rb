Rails.application.routes.draw do
  resources :advertisements do
    resources :comments, only: %i[create destroy]
  end

  root 'pages#index'
end
