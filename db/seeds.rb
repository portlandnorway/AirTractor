# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
require 'open-uri'

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
details = ["Thank you for taking this tractor off for some time. Hope it`s enough money! The key is in the garden behind house nr 10.", "Thanks! This is such a great tractor, hope you`ll love it! The tractor is in the backyard. You cant miss it :)", "Thanks! Key is under the door mat. Safe driving", "Thanks for letting the tractor out for some fresh air <3. The tractor is nr 5 from the house.", "What a great app! The tractor is heated up. I will send you more money later", "Thank you thank you THANK YOU <3<3. The tractor key is in my compost bin", "Should be easy to find. Call me if you have any questions. Have a great ride!", "Do not drive over 80km/h and no sex in the tractor please. Othervise, have fun.", "Under the gear pedal, there is a secret button to double the speed.", "The tractor will start if you open your mind and let go of everything. You will find the tractor in the backyard."]
tractors_picture = ["https://images.unsplash.com/photo-1507648750705-97521ffbe480?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80", "https://images.unsplash.com/photo-1526664781949-af414dc24053?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80", "https://images.unsplash.com/photo-1542158921223-4939bbed53f1?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=967&q=80", "https://images.unsplash.com/photo-1539805284066-d7b6b67a7198?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1189&q=80", "https://images.unsplash.com/photo-1506092490682-b2cc6b651308?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80", "https://images.unsplash.com/photo-1508042084044-8e6975d7272c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80", "https://images.unsplash.com/photo-1556150936-02cb76ccc788?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80", "https://images.unsplash.com/photo-1571353589026-4d75e9f96ef8?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80", "https://images.unsplash.com/photo-1513114841779-6e988bc8605c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80"]

puts 'Creating 9 fake tractors...'
counter_img = 0
9.times do
  tractor = Tractor.new(
    name: Faker::FunnyName.name,
    details: details.pop,
    reward: Faker::Number.number(digits: 3),
    user: User.all.sample,
    address: addresses.pop
  )
  file = URI.open(tractors_picture[counter_img])
  tractor.photo.attach(io: file, filename: 'tractor_image.png', content_type: 'image/png')
  tractor.save!
  counter_img += 1
end

puts 'Finished with the tractors!'

tractors = Tractor.all

puts 'Creating 9 fake bookings...'
counter = 0
9.times do
  t = tractors[counter]
  clean_users = User.all.reject { |user| user == t.user }
  booking = Booking.new(
    tractor: t,
    user: clean_users.sample,
    start_date: Faker::Date.between(from: 1.days.from_now, to: 2.days.from_now),
    end_date: Faker::Date.between(from: 3.days.from_now, to: 20.days.from_now)
  )
  booking.save!
  counter += 1
end

puts 'Finished with the orders! Do you want a tractor also?'
