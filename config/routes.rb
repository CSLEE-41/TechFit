Rails.application.routes.draw do
  



 

  devise_for :users


  resources :users, only: [:index, :show, :update] do
    resources :workouts
  end

  resources :users, only: [:index, :show, :update] do
    resources :nutrition_plans
  end
  
  get 'welcome/index'

  root to: "welcome#index"
end
