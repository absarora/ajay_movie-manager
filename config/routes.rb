Rails.application.routes.draw do

  devise_for :users
  resources :collections do
    resources :movies, except: [:index]
  end

  root to: 'home#index'
end
