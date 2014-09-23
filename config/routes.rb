Rails.application.routes.draw do

  resources :collections do
    resources :movies, except: [:index]
  end

  root to: 'home#index'
end
