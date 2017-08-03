Rails.application.routes.draw do
  root to: 'web_scrapers#new'
  resources :web_scrapers,  only: [ :index, :new, :create, :destroy]

  devise_for :users, controllers: { sessions: 'users/sessions' }
end

