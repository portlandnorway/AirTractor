# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

puts "Clearing the db..."
Booking.destroy_all
Tractor.destroy_all
User.destroy_all

puts 'Creating 100 fake users...'
100.times do
  user = User.new(
    email: Faker::Internet.email,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    phone_number: Faker::PhoneNumber.subscriber_number(length: 8),
    password: 'password'
  )
  user.save!
end

puts 'Finished with the users!'

addresses = ["Kirsten Flagstads Plass 1, 0150 Oslo", "Karl Johans gate 11, 0154 Oslo", "Slottsplassen 1, 0010 Oslo", "Pilestredet 72, 0354 Oslo", "Seilduksgata 15A, 0553 Oslo", "Lørenveien 38, 0585 Oslo", "Sverresgate 5, 0652 Oslo", "Ekebergveien 1, 0192 Oslo", "Ulvenveien 110, 0665 Oslo"]

puts 'Creating 9 fake tractors...'
9.times do
  tractor = Tractor.new(
    name: Faker::FunnyName.name,
    details: Faker::Lorem.paragraph_by_chars(number: 50, supplemental: false),
    reward: Faker::Number.number(digits: 3),
    user: User.all.sample,
    address: addresses.pop
  )
  tractor.save!
end

puts 'Finished with the tractors!'

puts 'Creating 9 fake bookings...'
9.times do
  t = Tractor.all.sample
  clean_users = User.all.reject { |user| user == t.user }
  booking = Booking.new(
    tractor: t,
    user: clean_users.sample
  )
  booking.save!
end

puts 'Finished with the orders! Do you want a tractor also?'
