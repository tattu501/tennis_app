Rails.application.routes.draw do
  root   'static_pages#home'
  get    '/profile', to: 'static_pages#profile'
  get    '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users
  resources :experiences
  resources :terms
  resources :posts do
    resources :comments, only: [:create, :edit, :update, :destroy]
  end
end
