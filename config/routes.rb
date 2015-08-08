Rails.application.routes.draw do
  
  devise_for :users
  resources :users, only: [:index,:show,:update]
  
  get 'welcome/index'

  root to: "welcome#index"
end
