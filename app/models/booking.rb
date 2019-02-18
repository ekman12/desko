class Booking < ApplicationRecord
  has_one :review
  belongs_to :listing
  belongs_to :user
end
