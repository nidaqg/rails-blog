Rails.application.routes.draw do
  root 'pages#home'
  get 'about', to: 'pages#about'
  get 'articles', to: 'articles#main'
  resources :articles, only: [:show]
end
