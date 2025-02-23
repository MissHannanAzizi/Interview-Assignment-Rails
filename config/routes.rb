Rails.application.routes.draw do

# Routes for HTML
resources :car_batteries, except: [:index, :show, :create, :update, :destroy] do
  collection do
    get :index
    get :new
    post :create
  end
  member do
    get :edit
    patch :update
    delete :destroy
  end
end

# Routes for API (JSON)
namespace :api do
  resources :car_batteries_api, only: [:index, :show, :create, :update, :destroy]
end


  # Authentication routes
  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get "/users", to: "users#index"
  root "sessions#new"
end
