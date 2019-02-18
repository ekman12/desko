class Listing < ApplicationRecord
  has_many :bookings
  belongs_to :user
  has_many :reviews, through: :bookings

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
