class AddBookingIdToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :booking_id, :string
  end
end
