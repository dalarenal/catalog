Rails.application.routes.draw do
  resources :movies, only: :index
  resources :seasons, only: :index
  resources :contents, only: :index
  resources :purchases, only: :create
end
