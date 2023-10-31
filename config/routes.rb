Rails.application.routes.draw do
  resources :advertisements do
    resources :comments, except: %i[new show]
  end

  root 'pages#index'
end
