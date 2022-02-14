Rails.application.routes.draw do
  devise_for :users

  resources :categories, except: [:edit, :update]
  resources :user_transactions, except: [:edit, :update]

  root "home#index"
end
