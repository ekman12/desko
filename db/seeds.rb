require 'faker'
# require "json"

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
      photo: "https://images.unsplash.com/photo-1515965885361-f1e0095517ea?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80",
      description: "This cosy central London flat is close to all the biggest Media agencies. It also has superfast wifi and a great coffee machine",
      location: "Chancery Lane",
      workhours: "9-5",
      kitchen: [true, false].sample,
      price: 14,
      user: User.all.sample
      )
    listing.save!
end

puts 'Creating 2000 bookings'

2000.times do
  start_d = (1..15).to_a
  end_d = (15..31).to_a
    booking =Booking.new(
      listing: Listing.all.sample,
      approved: [true, false].sample,
      start_date: Date.new(2019,3,start_d.sample),
      end_date: Date.new(2019,3,end_d.sample),
      user: User.all.sample
      )
    booking.save!
end

puts 'Creating 1000 reviews'

1000.times do
    review =Review.new(
      booking_id: Booking.all.sample.id,
      content: "This place is so cool!",
      rating: (0..5).to_a.sample,
      )
    review.save!
end

# city_name = "london"
# rows = 50
# listings_url = "https://public.opendatasoft.com/api/records/1.0/search/?dataset=airbnb-listings&q=number+of+reviews&rows=#{rows}&facet=host_response_time&facet=host_response_rate&facet=host_verifications&facet=city&facet=country&facet=property_type&facet=room_type&facet=bed_type&facet=amenities&facet=availability_365&facet=cancellation_policy&facet=features&refine.city=#{city_name}"
# reviews_url = "https://public.opendatasoft.com/api/records/1.0/search/?dataset=airbnb-reviews&rows=#{rows}&facet=listing_id&facet=reviewer_id&facet=reviewer_name"

# response = RestClient.get listings_url
# listings.each do |id|
#   parsed_hash = JSON.parse(listings)
#   Listing.create(
#     listing = Listing.new(
#         title: "#{Faker::Name.first_name.unique}'s Place",
#         photo: "https://images.unsplash.com/photo-1515965885361-f1e0095517ea?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80",
#         description: "This cosy central London flat is close to all the biggest Media agencies. It also has superfast wifi and a great coffee machine",
#         location: "Chancery Lane",
#         workhours: "9-5",
#         kitchen: true,
#         price: 14,
#       )
# end

# for listings
# json.records[0].fields.host_name - Returns string
# json.records[0].fields.geolocation - Returns array with coordinates
# json.records[0].fields.number_of_reviews - returns number of reviews
# json.records[0].fields.street - Returns full address
# json.records[0].fields.xl_picture_url - May return a picture or not
# json.records[0].fields.review_scores_value
# json.records[0].fields.description
# json.records[0].fields.smart_location - Retunrs country

# for reviews
# json.records[0].fields.comments
