Rails.application.routes.draw do
  get 'event/index'

  get 'event/edit'

  get 'event/update'

  get 'event/destroy'

  devise_for :users


  resources :users, only: [:index, :show, :update] do
    resources :workouts
  end

  resources :events

  resources :users, only: [:index, :show, :update] do
    resources :nutrition_plans
  end
  
  get 'welcome/index'

  root to: "welcome#index"
end
