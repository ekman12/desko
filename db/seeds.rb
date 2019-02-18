require 'faker'

DESK_PHOTOS = [
'https://images.unsplash.com/photo-1526657782461-9fe13402a841?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
'https://images.unsplash.com/photo-1528557242643-e981f34a4058?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
'https://images.unsplash.com/photo-1521649415036-659258dc424f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
'https://images.unsplash.com/photo-1515965885361-f1e0095517ea?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
'https://images.unsplash.com/photo-1522152302542-71a8e5172aa1?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
'https://images.unsplash.com/photo-1505330622279-bf7d7fc918f4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
'https://images.unsplash.com/photo-1490135900376-2e86d918a23b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
'https://images.unsplash.com/photo-1492724441997-5dc865305da7?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
'https://images.unsplash.com/photo-1496128858413-b36217c2ce36?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
'https://images.unsplash.com/photo-1523400396672-db241b5292fe?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
'https://images.unsplash.com/photo-1463620695885-8a91d87c53d0?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
'https://images.unsplash.com/photo-1497681883844-82b4f0a359a4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
'https://images.unsplash.com/photo-1483470134942-13bbf4677d84?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
'https://images.unsplash.com/photo-1486946255434-2466348c2166?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
'https://images.unsplash.com/photo-1522684894605-cdcdf44be259?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
'https://images.unsplash.com/photo-1528372444006-1bfc81acab02?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
'https://images.unsplash.com/photo-1547586696-31bfb413bdf1?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60'
]

puts 'Creating 10 users'

10.times do
  user = User.new(
      name: Faker::Name.unique.name,
      email: Faker::Internet.unique.email,
      password: "123456"
    )
  user.save!
end

puts 'Creating 50 listings'


50.times do
    listing =Listing.new(
      title: "#{User.all.sample.name} Place",
      description: Faker::Books::Lovecraft.paragraph,
      location: Faker::Address.city,
      workhours: ["9-5","8-4","10-6","10-4"].sample,
      kitchen: [true, false].sample,
      price: (10..40).to_a.sample,
      user: User.all.sample
      )
  listing.remote_photo_url = DESK_PHOTOS.sample
  listing.save!
end


puts 'Creating 100 bookings'

100.times do
  start_d = (1..15).to_a
  end_d = (15..31).to_a
    new_booking = Booking.new(
      listing: Listing.all.sample,
      approved: ["confirmed", "rejected", "pending"].sample,
      start_date: Date.new(2019,3,start_d.sample),
      end_date: Date.new(2019,3,end_d.sample),
      user: User.all.sample
      )
    new_booking.save!
      if new_booking.approved == "confirmed"
          review =Review.new(
            booking: new_booking,
            content: Faker::Restaurant.review,
            rating: (0..5).to_a.sample,
            )
          review.save!
      end
end


