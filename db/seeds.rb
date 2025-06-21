# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# db/seeds.rb

# Clear old data
# db/seeds.rb

# Clear old data
Favorite.destroy_all
User.destroy_all
MtlEvent.destroy_all
Song.destroy_all
Artist.destroy_all
Brand.destroy_all

# Create test user
user = User.create!(
  email: "test@example.com",
  password: "password"
)

# Brands (without images)
brands = [
  { name: "Artgang" },
  { name: "Maison Montreal" },
  { name: "SnowCo" },
  { name: "SkateMTL" },
  { name: "RUG MTL" }
]

brands.each { |b| Brand.create!(b) }

# Artists (without images)
artist1 = Artist.create!(name: "Laval Boy", genre: "Rap")
artist2 = Artist.create!(name: "DJ Marie", genre: "House")
artist3 = Artist.create!(name: "Snow Poet", genre: "Indie")
artist4 = Artist.create!(name: "The 514s", genre: "Rock")

# Songs (without images)
Song.create!(title: "Northside Dreams", genre: "Rap", artist: artist1)
Song.create!(title: "Late Night Rides", genre: "Rap", artist: artist1)
Song.create!(title: "Midnight at SAT", genre: "House", artist: artist2)
Song.create!(title: "Mont Royal Lights", genre: "Indie", artist: artist3)
Song.create!(title: "Plateau Riot", genre: "Rock", artist: artist4)

# Events (without images)
events = [
  { name: "Le Belmont - Bass Night", location: "Montreal", age_restriction: "18+", price: 15 },
  { name: "MTL Street Fest", location: "Saint-Laurent", age_restriction: "All Ages", price: 0 },
  { name: "Vinyl Dreams", location: "Bar Le Ritz", age_restriction: "15+", price: 12 },
  { name: "Mountaintop Sessions", location: "Mont Royal Chalet", age_restriction: "All Ages", price: 8 },
  { name: "Underground Beats", location: "Secret Location", age_restriction: "18+", price: 20 }
]

events.each { |e| MtlEvent.create!(e) }
