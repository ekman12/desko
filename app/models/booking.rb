class Booking < ApplicationRecord
  has_many :reviews
  belongs_to :listing
  belongs_to :user
end
