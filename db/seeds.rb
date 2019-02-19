require 'faker'
require 'open-uri'
require 'pry-byebug'
require 'json'

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

DESK_ADDRESSES = [
'Greengate Street, Plaistow, London E13',
'Boundaries Road, London SW12',
'Batoum Gardens, London W6',
'Faversham Avenue, North Chingford, London E4',
'Brunswick Quay, London SE16',
'Hampton Street, London SE1',
'Oswin Street, London SE11',
'Roupell Street, London SE1',
'Stretford Road, Hulme, Manchester M15',
'Springdale Gardens, Manchester M20',
'Scholes Lane, Prestwich, Manchester, Greater Manchester M25',
'Talbot Road, Manchester M16',
'Manchester Road, Droylsden, Manchester M43',
'Folly Lane, Swinton, Manchester M27',
'Withington Road, Whalley Range, Manchester M16',
'Lilac Avenue, Swinton, Manchester M27'
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

puts 'Creating 16 listings'


DESK_ADDRESSES.each do |a|
    listing =Listing.new(
      title: "#{User.all.sample.name} Place",
      description: Faker::Books::Lovecraft.paragraph,
      location: a,
      workhours: ["9-5","8-4","10-6","10-4"].sample,
      kitchen: [true, false].sample,
      price: (10..40).to_a.sample,
      user: User.all.sample
      )
      listing.remote_photo_url = DESK_PHOTOS.sample
      url = "https://api.mapbox.com/geocoding/v5/mapbox.places/#{a.gsub(" ","%20")}.json?access_token=pk.eyJ1IjoiY2Fpb2FiaWJlIiwiYSI6ImNqcnI3M2RlNzF3ZDM0YW4zZzlocGloY24ifQ.VxwFbGxDMfroaQ686rUbDg"
      response_serialized = open(url).read
      response = JSON.parse(response_serialized)
      listing.latitude = response["features"][0]["geometry"]["coordinates"][0]
      listing.longitude = response["features"][0]["geometry"]["coordinates"][1]
  listing.save!
end


puts 'Creating 100 bookings'

20.times do
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
