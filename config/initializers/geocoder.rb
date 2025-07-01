Geocoder.configure(
  # Use Mapbox as the geocoding service
  lookup: :mapbox,

  # Mapbox API Key (set it in .env or ENV)
  api_key: ENV["MAPBOX_API_KEY"],

  # Set request timeout (in seconds)
  timeout: 5,

  # Distance units
  units: :km,

  # Use HTTPS
  use_https: true
)
