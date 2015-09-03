Rails.application.routes.draw do



  devise_for :users


  resources :users, only: [:index, :show, :update] do
    resources :workouts
  end

  resources :events

  resources :users, only: [:index, :show, :update] do
    resources :nutrition_plans
  end

  resources :users, only: [:index, :show, :update] do
    resources :recipes
  end

  resources :users, only: [:index, :show, :update] do
    resources :photos
  end

  resources :users, only: [:show] do
    resources :trackers
  end

  resources :users, only: [:show] do
    resources :goal_lists
  end

  resources :goal_lists, only: [:index] do
    resources :goals
  end

  resources :users, only: [:show] do
    resources :events
  end
  
  get 'welcome/index'

  root to: "welcome#index"
end
