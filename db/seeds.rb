# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

listing = Listing.new(
    title: "Jed's Place",
    photo: "https://images.unsplash.com/photo-1515965885361-f1e0095517ea?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80",
    description: "This cosy central London flat is close to all the biggest Media agencies. It also has superfast wifi and a great coffee machine",
    location: "Chancery Lane",
    workhours: "9-5",
    kitchen: true,
    price: 14,
  )

listing.save
