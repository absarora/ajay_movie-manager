Rails.application.routes.draw do
  resources :movies

  resources :collections

  root to: 'home#index'
end
