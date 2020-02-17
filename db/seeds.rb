# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

puts 'Creating 100 fake users...'
100.times do
  user = User.new(
    email: Faker::Internet.email,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    phone_number: Faker::PhoneNumber.subscriber_number(length: 8)
  )
  user.save!
end

puts 'Finished with the users!'

b = (1..100).to_a.shuffle

puts 'Creating 100 fake tractors...'
100.times do
  tractor = Tractor.new(
    name: Faker::FunnyName.name,
    details: Faker::Vehicle.car_options,
    reward: Faker::Number.number(digits: 3),
    user_id: b.pop,
    address: Faker::Address.street_address
  )
  tractor.save!
end

puts 'Finished with the tractors!'

a = (1..100).to_a.shuffle

puts 'Creating 20 fake booking...'
20.times do
  booking = Booking.new(
    tractor_id: a.pop,
    user_id: rand(1..100)
  )
  booking.save!
end

puts 'Finished with the orders! Do you want a tractor also?'
