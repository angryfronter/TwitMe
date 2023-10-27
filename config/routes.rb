Rails.application.routes.draw do
  get '/advertisements', to: 'advertisements#index'
  root 'pages#index'
end
