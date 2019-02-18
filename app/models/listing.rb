class Listing < ApplicationRecord
  has_many :bookings
  belongs_to :user
  has_many :reviews, through: :bookings
  mount_uploader :photo, PhotoUploader
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  include PgSearch
  pg_search_scope :search_by_location,
                  against: :location,
                  using: {
                    tsearch: { prefix: true }
                  }
end
