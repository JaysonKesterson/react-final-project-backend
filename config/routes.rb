Rails.application.routes.draw do

  post "api/v1/login", to: "api/v1/sessions#create"
  post "api/v1/signup", to: "api/v1/users#create"
  delete "api/v1/logout", to: "api/v1/sessions#destroy"
  get "api/v1/get_current_user", to: "api/v1/sessions#get_current_user"
  get "api/v1/get_current_user_store", to: "api/v1/stores#get_current_user_store"
  patch "api/v1/transaction", to: "api/v1/users#transaction"
  namespace :api do
    namespace :v1 do
      resources :users 
      resources :stores
      resources :items
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
