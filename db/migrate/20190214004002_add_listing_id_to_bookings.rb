class AddListingIdToBookings < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :listing_id, :integer
  end
end
