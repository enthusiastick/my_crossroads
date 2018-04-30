Rails.application.routes.draw do
  root "pages#index"

  get "staff-menu", to: "pages#staff_menu", as: :staff_menu
  get "sign-in", to: "sessions#new", as: :sign_in
  post "sign-in", to: "sessions#create"
  delete "sign-out", to: "sessions#destroy"
  get "sign-up", to: "users#new", as: :sign_up

  namespace :staff do
    namespace :review do
      resources :staff_profiles, only: [:update]
    end
    resources :characters, only: [:destroy, :index, :update]
    resources :character_inventories, only: [:update]
    resources :components, except: [:create, :destroy, :update] do
      collection do
        resources :filters, only: [:show]
        resources :pictures, only: [:index]
      end
    end
    resources :events, only: [:create, :destroy, :edit, :new, :update] do
      resources :bookings, only: [:index]
      resources :self_reports, only: [:index]
    end
    resources :ingredients, controller: :components, only: [:create, :destroy, :update]
    resources :inventories, only: [:destroy]
    resources :professions, only: [:index, :show]
    resources :profession_links, only: [:create, :new, :update]
    resources :profiles, only: [:index]
    resources :recipes do
      resources :character_recipes, only: [:new, :create]
    end
    resources :receipts, only: [:show]
    resources :review_profiles, only: [:index]
    resources :staff_profiles, only: [:create, :update]
    resources :users, only: [:index, :show] do
      resources :characters, only: [:edit, :show] do
        resources :character_recipes, only: [:index, :new, :create, :show]
        resources :inventories, only: [:index]
      end
    end
    resources :recipes
    resources :user_staff_statuses, only: [:update]
    resources :user_editor_statuses, only: [:update]
  end

  resources :account_confirmations, only: [:edit]
  resources :bank_accounts
  resources :bookings, only: [:new, :update]
  resources :cash_bookings, only: [:new, :create]
  resources :characters, only: [:create, :edit, :index, :new, :show, :update] do
    resources :character_recipes, only:[:index, :show]
    resources :bank_accounts, only: [:show, :edit, :new] do
      resources :bank_transactions
    end
  end
  resources :events, only: [:index, :show]
  resources :password_resets, only: [:create, :edit, :new, :update]
  resources :receipts, only: [:create]
  resources :recipes, only:[:show]
  resources :staff, only: [:index] do
    resources :messages, only: [:create, :new]
  end
  resources :users, only: [:create, :edit, :update]
end
