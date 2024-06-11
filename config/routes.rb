Rails.application.routes.draw do
  get 'password_resets/new'
  get 'password_resets/edit'

  root "static_pages#home"

  # get 'static_pages/home'
  # get 'static_pages/help'
  # get 'static_pages/about'
  # get  "static_pages/contact"

  get  "/help",    to: "static_pages#help"
  get  "/about",   to: "static_pages#about"
  get  "/contact", to: "static_pages#contact"
  get  "/signup",  to: "users#new"
  get    "/login",   to: "sessions#new"
  post   "/login",   to: "sessions#create"
  delete "/logout",  to: "sessions#destroy"
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :account_activations, only: [:edit]
  resources :microposts,          only: [:create, :destroy]
  resources :relationships,       only: [:create, :destroy]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  get '/microposts', to: 'static_pages#home'
end
