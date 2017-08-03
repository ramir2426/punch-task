Rails.application.routes.draw do
  root to: 'web_scrapers#index'
  resources :web_scrapers

  devise_for :users
end

