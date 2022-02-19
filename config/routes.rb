Rails.application.routes.draw do
  devise_for :users

  resources :categories, except: [:edit, :update] do
    resources :user_transactions, except: [:edit, :update]
  end

  resources :users do
    member do
      get :confirm_email
    end
  end
  root "home#index"
end
