Rails.application.routes.draw do
  # Devise authentication
  devise_for :users

  # Root
  root to: "pages#home"

  # Static or semi-static pages
  get "/music", to: "pages#music"
  get "/events", to: "pages#events"
  get "/advertise", to: "pages#advertise"
  get "/searchbar", to: "pages#searchbar"
  get "/discover", to: "pages#discover"

  # Favorites
  resources :favorites, only: [:create, :destroy]
  get "/favorites", to: "favorites#index", as: :user_favorites

  # Brands and Products
  resources :brands, only: [:index, :show]
  resources :products, only: [:show]

  # Cart (with custom add/remove routes)
  resource :cart, controller: "cart", only: [:show] do
    post "add/:product_id", to: "cart#add", as: :add_to
    delete "remove/:product_id", to: "cart#remove", as: :remove_from
  end

  # Health check
  get "up" => "rails/health#show", as: :rails_health_check
end
