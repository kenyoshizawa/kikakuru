Rails.application.routes.draw do
  root 'home#index'
  resources :users, only: %i[new create]
  resources :schedules, only: %i[destroy]
  resources :events, param: :url do
    resources :messages, only: %i[index]
  end
end
