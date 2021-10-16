Rails.application.routes.draw do
  root 'home#index'
  resources :events, param: :url
end
