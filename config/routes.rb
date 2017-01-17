Rails.application.routes.draw do
  root "pages#index"

  get "admin", to: "pages#admin"
  get "sign-in", to: "sessions#new", as: :sign_in
  post "sign-in", to: "sessions#create"
  delete "sign-out", to: "sessions#destroy"
  get "sign-up", to: "users#new", as: :sign_up

  namespace :admin do
    resources :characters, only: [:index]
    resources :components, except: [:create, :destroy, :update]
    resources :ingredients, controller: :components, only: [:create, :destroy, :update]
    resources :users, only: [:index, :show] do
      resources :characters, only: [:show]
    end
  end

  resources :account_confirmations, only: [:edit]
  resources :characters, only: [:create, :new, :index]
  resources :password_resets, only: [:create, :edit, :new, :update]
  resources :users, only: [:create, :edit, :update] do
    resources :characters, only: [:edit, :show, :update]
  end
end
