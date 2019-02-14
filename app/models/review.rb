class Review < ApplicationRecord
  belongs_to :booking
  belongs_to :listing, through: :bookings
end
