# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

puts "Clear the db"
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

puts 'Creating 100 fake tractors...'
100.times do
  tractor = Tractor.new(
    name: Faker::FunnyName.name,
    details: Faker::Lorem.paragraph_by_chars(number: 50, supplemental: false),
    reward: Faker::Number.number(digits: 3),
    user: User.all.sample,
    address: Faker::Address.street_address
  )
  tractor.save!
end

puts 'Finished with the tractors!'

puts 'Creating 20 fake booking...'
20.times do
  t = Tractor.all.sample
  clean_users = User.all.reject { |user| user == t.user }
  booking = Booking.new(
    tractor: t,
    user: clean_users.sample
  )
  booking.save!
end

puts 'Finished with the orders! Do you want a tractor also?'
