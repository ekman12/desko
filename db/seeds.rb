require 'faker'
#changes in case
# require "json"

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
      # photo: DESK_PHOTOS.sample,
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

50.times do
  start_d = (1..15).to_a
  end_d = (15..31).to_a
    new_booking = Booking.new(
      listing: Listing.all.sample,
      approved: false,
      start_date: Date.new(2019,3,start_d.sample),
      end_date: Date.new(2019,3,end_d.sample),
      user: User.all.sample
      )
    new_booking.save!
end



puts 'Creating 1000 reviews'

1000.times do
    review =Review.new(
      booking: Booking.all.sample,
      content: Faker::Restaurant.review,
      rating: (0..5).to_a.sample,
      )
    review.save!
end





# 10.times do
#     user = User.new(
#         name: Faker::Name.unique.name,
#         email: Faker::Internet.unique.email,
#         password: "123456"
#       )
#     user.save!
# end

# puts 'Creating 100 listings'

# 100.times do
#     listing =Listing.new(
#       title: "#{User.all.sample.name} Place",
#       photo: "https://images.unsplash.com/photo-1515965885361-f1e0095517ea?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80",
#       description: "This cosy central London flat is close to all the biggest Media agencies. It also has superfast wifi and a great coffee machine",
#       location: "Chancery Lane",
#       workhours: "9-5",
#       kitchen: [true, false].sample,
#       price: 14,
#       user: User.all.sample
#       )
#     listing.save!
# end

# puts 'Creating 30 bookings'

# 30.times do
#   start_d = (1..15).to_a
#   end_d = (15..31).to_a
#     booking =Booking.new(
#       listing: Listing.all.sample,
#       approved: [true, false].sample,
#       start_date: Date.new(2019,3,start_d.sample),
#       end_date: Date.new(2019,3,end_d.sample),
#       user: User.all.sample
#       )
#     booking.save!
# end

# puts 'Creating 10 reviews'

# 10.times do
#     review =Review.new(
#       booking_id: Booking.all.sample.id,
#       content: "This place is so cool!",
#       rating: (0..5).to_a.sample,
#       )
#     review.save!
# end

# # city_name = "london"
# # rows = 50
# # listings_url = "https://public.opendatasoft.com/api/records/1.0/search/?dataset=airbnb-listings&q=number+of+reviews&rows=#{rows}&facet=host_response_time&facet=host_response_rate&facet=host_verifications&facet=city&facet=country&facet=property_type&facet=room_type&facet=bed_type&facet=amenities&facet=availability_365&facet=cancellation_policy&facet=features&refine.city=#{city_name}"
# # reviews_url = "https://public.opendatasoft.com/api/records/1.0/search/?dataset=airbnb-reviews&rows=#{rows}&facet=listing_id&facet=reviewer_id&facet=reviewer_name"

# # response = RestClient.get listings_url
# # listings.each do |id|
# #   parsed_hash = JSON.parse(listings)
# #   Listing.create(
# #     listing = Listing.new(
# #         title: "#{Faker::Name.first_name.unique}'s Place",
# #         photo: "https://images.unsplash.com/photo-1515965885361-f1e0095517ea?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80",
# #         description: "This cosy central London flat is close to all the biggest Media agencies. It also has superfast wifi and a great coffee machine",
# #         location: "Chancery Lane",
# #         workhours: "9-5",
# #         kitchen: true,
# #         price: 14,
# #       )
# # end

# # for listings
# # json.records[0].fields.host_name - Returns string
# # json.records[0].fields.geolocation - Returns array with coordinates
# # json.records[0].fields.number_of_reviews - returns number of reviews
# # json.records[0].fields.street - Returns full address
# # json.records[0].fields.xl_picture_url - May return a picture or not
# # json.records[0].fields.review_scores_value
# # json.records[0].fields.description
# # json.records[0].fields.smart_location - Retunrs country

# # for reviews
# # json.records[0].fields.comments
