Rails.application.routes.draw do
  # Devise
  devise_for :users

  # Root
  root to: "pages#home"

  # Static Pages
  get "/events", to: "pages#events"
  get "/advertise", to: "pages#advertise"
  get "/searchbar", to: "pages#searchbar"
  get "/discover", to: "pages#discover"

  # Music
  get "/music", to: "musics#index", as: :music
  resources :musics, only: [:index, :show, :edit, :update]

  # Songs & Artists (linked on music pages)
  resources :songs, only: [:index, :show]
  resources :artists, only: [:index, :show]

  # Favorites with Turbo (stay on same page)
  resources :favorites, only: [:create, :destroy], defaults: { format: :turbo_stream }
  get "/favorites", to: "favorites#index", as: :user_favorites

  # Brands and Products
  resources :brands, only: [:index, :show]
  resources :products, only: [:show]

  # Cart
  resource :cart, only: [:show] do
    post "add/:product_id", to: "cart#add", as: :add_to
    delete "remove/:product_id", to: "cart#remove", as: :remove_from
  end

  # Health check
  get "up" => "rails/health#show", as: :rails_health_check
end
