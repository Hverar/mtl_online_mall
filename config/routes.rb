Rails.application.routes.draw do
  # Devise authentication
  devise_for :users

  # Root page
  root to: "pages#home"

  # Static Pages
  get "/advertise", to: "pages#advertise"
  get "/discover",  to: "pages#discover"
  get "/search",    to: "pages#searchbar", as: :search

  # Music
  get "/music", to: "musics#index", as: :music
  resources :musics, only: [:index, :show, :edit, :update]

  # Songs & Artists
  resources :songs, only: [:index, :show]
  resources :artists, only: [:index, :show]

  # Events
  resources :mtl_events, path: "events", only: [:index, :show]

  # Favorites with Turbo Streams
  resources :favorites, only: [:create, :destroy], defaults: { format: :turbo_stream }
  get "/favorites", to: "favorites#index", as: :user_favorites

  # Brands and Products
  resources :brands, only: [:index, :show]
  resources :products, only: [:show]

  # Cart functionality
  resource :cart, only: [:show] do
    post   "add/:product_id",    to: "cart#add",    as: :add_to
    delete "remove/:product_id", to: "cart#remove", as: :remove_from
  end

  # Health check
  get "up", to: "rails/health#show", as: :rails_health_check
end
