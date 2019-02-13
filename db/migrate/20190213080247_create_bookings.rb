class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.boolean :approved
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
