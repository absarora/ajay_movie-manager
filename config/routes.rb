Rails.application.routes.draw do
  resources :collections

  root to: 'home#index'
end
