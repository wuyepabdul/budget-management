Rails.application.routes.draw do
  devise_for :users

  resources :categories, except: [:edit, :update] do
    resources :user_transactions, except: [:edit, :update]
  end

  root "home#index"
end
