Rails.application.routes.draw do
  root 'home#index'
  resources :events, param: :url
  resources :users, only: %i[new create]
  resources :schedules, only: %i[destroy]
end
