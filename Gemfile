source "https://rubygems.org"

ruby "3.3.5"

# Rails
gem "rails", "~> 7.1.5", ">= 7.1.5.1"

# Database
gem "pg", "~> 1.1"

# Server
gem "puma", ">= 5.0"

# Frontend: Importmap (no bundling)
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"

# Assets
gem "sprockets-rails"
gem "sassc-rails"
gem "autoprefixer-rails"
gem "bootstrap", "~> 5.3"
gem "font-awesome-sass", "~> 6.1"
gem "mini_magick"
gem "cloudinary"
gem "activestorage-cloudinary-service"
gem "image_processing"
gem "geocoder"




# Forms & Auth
gem "simple_form", github: "heartcombo/simple_form"
gem "devise"

# JSON API builder
gem "jbuilder"

# Speed up boot
gem "bootsnap", require: false

# Windows support
gem "tzinfo-data", platforms: %i[windows jruby]

group :development, :test do
  gem "dotenv-rails"
  gem "debug", platforms: %i[mri windows]
end

group :development do
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
end

# Optional – only for legacy Heroku stacks like heroku-20
group :production do
  gem "rails_12factor"
end
