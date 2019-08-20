# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts "Destroying previous seeds"

Booking.destroy_all
Van.destroy_all
User.destroy_all

puts "Seeds Destroyed"

puts "Creating seeds for user, vans, and bookings"

10.times do
  user = User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: Faker::Internet.password(min_length: 8),
    photo: Faker::LoremPixel.image(size: "60x60"),
    bio: Faker::Lorem.paragraph(sentence_count: 4)
    )
end

puts "Now we have #{User.count} users"

25.times do
  van = Van.create(
    title: Faker::Coffee,
    description: Faker::Lorem.paragraph(sentence_count: 4),
    address: Faker::Address.full_address,
    van_model: Faker::Vehicle.make,
    sleeping_capacity: rand(1..4),
    price_cents: rand(1000..10000),
    photo: Faker::LoremFlickr.image(size: "1080x720"),
    user: User.find(rand(1..6))
    )
end

puts "Now we have #{Van.count} vans"

# Past (current) Bookings
10.times do
  booking = Booking.create(
    start_date: Faker::Date.backward(days: rand(1..10)),
    end_date: Faker::Date.forward(days: rand(1..10)),
    pax: rand(1..4),
    user: User.find(rand(2..10)),
    van: Van.find(rand(1..19))
    )
end

10.times do
  booking = Booking.create(
    start_date: Faker::Date.forward(days: rand(1..10)),
    end_date: Faker::Date.forward(days: rand(11..20)),
    pax: rand(1..4),
    user: User.find(rand(2..10)),
    van: Van.find(rand(1..19))
    )
end

puts "Now we have #{Booking.count} bookings"

puts "Seeding completed"
