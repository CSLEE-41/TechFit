Rails.application.routes.draw do
  



  devise_for :users


  resources :users, only: [:index, :show, :update] do
    resources :workouts
  end
  
  get 'welcome/index'

  root to: "welcome#index"
end
