class User < ApplicationRecord
  # Devise modules
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Associations for favoriting any model (polymorphic)
  has_many :favorites, dependent: :destroy
  has_many :favorite_events, through: :favorites, source: :favoritable, source_type: 'Event'

  # You can later add other favorites:
  # has_many :favorite_brands, through: :favorites, source: :favoritable, source_type: 'Brand'
end
