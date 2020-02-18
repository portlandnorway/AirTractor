# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

b = (1..100).to_a.shuffle

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

tractor_details = ["Full-size spare tire w/aluminum alloy wheel", "Back-up camera", "Carpeted cargo area", "New York city colors" "Silver accent IP trim finisher -inc: silver shifter finisher", "Back-up camera", "Water-repellent windshield & front door glass", "Floor carpeting", "DVD System", "MP3 (Single Disc)", "Tow Package", "DVD plater", "Cassette Player", "Bucket Seats", "Cassette Player", "Leather Interior", "AM/FM Stereo", "Third Row Seats", "Turbo-mode", "Dracula mode"]

puts 'Creating 100 fake tractors...'
100.times do
  tractor = Tractor.new(
    name: Faker::FunnyName.name,
    details: tractor_details.sample(3),
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
