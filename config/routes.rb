Rails.application.routes.draw do
  root "pages#index"

  get "staff", to: "pages#staff"
  get "sign-in", to: "sessions#new", as: :sign_in
  post "sign-in", to: "sessions#create"
  delete "sign-out", to: "sessions#destroy"
  get "sign-up", to: "users#new", as: :sign_up

  namespace :staff do
    resources :characters, only: [:destroy, :index, :update]
    resources :character_inventories, only: [:update]
    resources :components, except: [:create, :destroy, :update] do
      collection do
        resources :filters, only: [:show]
        resources :pictures, only: [:index]
      end
    end
    resources :events, only: [:create, :destroy, :edit, :new, :update]
    resources :ingredients, controller: :components, only: [:create, :destroy, :update]
    resources :users, only: [:index, :show] do
      resources :characters, only: [:edit, :show] do
        resources :inventories, only: [:index]
      end
    end
    resources :user_staff_statuses, only: [:update]
  end

  resources :account_confirmations, only: [:edit]
  resources :bookings, only: [:new]
  resources :characters, only: [:create, :new, :index]
  resources :events, only: [:index, :show]
  resources :password_resets, only: [:create, :edit, :new, :update]
  resources :receipts, only: [:create]
  resources :users, only: [:create, :edit, :update] do
    resources :characters, only: [:edit, :show, :update]
  end
end
