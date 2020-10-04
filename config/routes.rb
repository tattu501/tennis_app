Rails.application.routes.draw do
  get 'users/new'
  root 'static_pages#home'
  get  '/profile',  to: 'static_pages#profile'
  get  '/signup',   to: 'users#new'
  resources :users
end
