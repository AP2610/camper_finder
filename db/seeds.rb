# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts "Destroying previous seeds"

Review.destroy_all
Booking.destroy_all
Van.destroy_all
User.destroy_all

puts "Seeds Destroyed"


# Creating 10 addresses

addresses1 = [
  "2 Theobalds Rd, Holborn, London",
  "16 Villa Gaudelet, Paris",
  "2 Overhoeksplein, Amsterdam",
  "100 Alte Jakobstraße, Berlin",
  "250 Rue Royale, Bruxelles",
]

addresses2 = [
  "150 London Wall, London",
  "1 Avenue du Colonel Henri Rol-Tanguy, Paris",
  "Postjesweg 106 bg, Amsterdam",
  "Brunnenstraße 105, Berlin",
  "Square de l'Atomium, Bruxelles"
]

# Create test seeds for each model where the user password is known

puts "Creating individual user"

test_user = User.create(
  first_name: "Test",
  last_name: "User",
  email: "test_user@gmail.com",
  password: "1234567",
  remote_photo_url: 'https://i.pravatar.cc/60',
  bio: Faker::Lorem.paragraph(sentence_count: 4)
  )

puts "Individual user created"

puts "Creating individual van"

test_van = Van.create(
  title: "#{Faker::Coffee.blend_name} Van",
  description: Faker::Lorem.paragraph(sentence_count: 27),
  address: addresses1.sample,
  van_model: Faker::Vehicle.make,
  sleeping_capacity: rand(1..4),
  price_cents: rand(1000..10000),
  remote_photo_url: "https://loremflickr.com/1080/720/motorhome",
  user: test_user
  )

puts "Individual van created"

puts "Creating individual booking"

test_booking = Booking.create(
  start_date: Faker::Date.forward(days: rand(1..10)),
  end_date: Faker::Date.forward(days: rand(11..20)),
  pax: rand(1..4),
  user: test_user,
  van: test_van
  )

puts "Individual booking created"


puts "Creating individual review"
  test_review = Review.create(
    rating: rand(1..5),
    content: Faker::Lorem.paragraph(sentence_count: 15),
    booking: test_booking
    )

puts "Individual review created"
# Create multiple seeds for each model for the sake of mock data

puts "Creating seeds for user, vans, and bookings"

5.times do
  user = User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.unique.email,
    password: Faker::Internet.password(min_length: 8),
    remote_photo_url: "https://i.pravatar.cc/60",
    bio: Faker::Lorem.paragraph(sentence_count: 4)
    )
end

puts "Now we have #{User.count} users"


# User.all.each do |user|
5.times do
  van = Van.create(
    title: "#{Faker::Coffee.blend_name} Van",
    description: Faker::Lorem.paragraph(sentence_count: 27),
    address: addresses1.sample,
    van_model: Faker::Vehicle.make,
    sleeping_capacity: rand(1..4),
    price_cents: rand(1000..10000),
    remote_photo_url: "https://loremflickr.com/1080/720/motorhome",
    user: User.all.sample
    )
end

5.times do
  van = Van.create(
    title: "#{Faker::Coffee.blend_name} Van",
    description: Faker::Lorem.paragraph(sentence_count: 27),
    address: addresses2.sample,
    van_model: Faker::Vehicle.make,
    sleeping_capacity: rand(1..4),
    price_cents: rand(1000..10000),
    remote_photo_url: "https://loremflickr.com/1080/720/motorhome",
    user: User.all.sample
    )
end
puts "Now we have #{Van.count} vans"

# Past (current) Bookings
past_booking = []

10.times do
  booking = Booking.create(
    start_date: Faker::Date.backward(days: rand(1..10)),
    end_date: Faker::Date.forward(days: rand(1..10)),
    pax: rand(1..4),
    user: User.all.sample,
    van: Van.all.sample
    )
  past_booking << booking

end

10.times do
  booking = Booking.create(
    start_date: Faker::Date.forward(days: rand(1..10)),
    end_date: Faker::Date.forward(days: rand(11..20)),
    pax: rand(1..4),
    user: User.all.sample,
    van: Van.all.sample
    )
end

puts "Now we have #{Booking.count} bookings"



puts "Add reviews to past bookings"



  past_booking.each do |booking|

  review = Review.create(
    rating: rand(1..5),
    content: Faker::Lorem.paragraph(sentence_count: 15),
    booking: booking
    )
  end


puts "Now we have #{Review.count} reviews"

puts "Seeding completed"
