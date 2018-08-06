Rails.application.routes.draw do
  get 'password_resets/new'
  get 'password_resets/edit'
  scope "(:locale)", locale: /en|vi/ do
    root "static_pages#home"
    get "/signup", to: "users#new"
    post "/signup", to: "users#create"
    get "/login", to: "sessions#new"
    post "/login", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"
    resources :users
    resources :account_activations, only: :edit
    resources :password_resets, except: [:show, :index, :destroy]
    resources :trips, except: [:edit, :update, :destroy] do
      resources :participations, only: [:create, :destroy]
      resources :searchs, only: :index
    end
    resources :reviews do
      resources :comments
    end
    resources :comments do
      resources :comments
    end
    get "/about", to: "static_pages#about"
    resources :chatrooms, param: :slug
    resources :messages
    resources :reviews
    get "hastags/:title", to: "hastags#show", as: :hastag
    mount ActionCable.server => "/cable"
  end
end
