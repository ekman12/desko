class AddUserIdToBookings < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :user_id, :string
  end
end
