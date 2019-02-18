class Listing < ApplicationRecord
  has_many :bookings
  belongs_to :user
  has_many :reviews, through: :bookings
  has_many :wishlist_items
  mount_uploader :photo, PhotoUploader
end

