Rails.application.routes.draw do
  root 'static_pages#home'
  get  '/profile',  to: 'static_pages#profile'
end
