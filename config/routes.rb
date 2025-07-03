Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  get "/advertise", to: "pages#advertise"
  get "/discover",  to: "pages#discover"
  get "/search",    to: "pages#searchbar", as: :search

  get "/music", to: "musics#index", as: :music
  resources :musics, only: [:index, :show, :edit, :update]
  resources :songs, only: [:index, :show]
  resources :artists, only: [:index, :show]
  resources :mtl_events, path: "events", only: [:index, :show]
  resources :favorites, only: [:create, :destroy], defaults: { format: :turbo_stream }
  get "/favorites", to: "favorites#index", as: :user_favorites
  resources :brands, only: [:index, :show]
  resources :products, only: [:show]

  resource :cart, only: [:show], controller: "carts" do
    post   "add/:product_id",    to: "carts#add",    as: :add_to
    delete "remove/:product_id", to: "carts#remove", as: :remove_from
  end

  get "up", to: "rails/health#show", as: :rails_health_check
end
