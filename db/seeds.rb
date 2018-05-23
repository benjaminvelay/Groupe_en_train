# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
_
puts 'Creating 10 fake trips'

10.times do
  trip = Trip.new(
    departure_at: DateTime.new(2018,2,3,4,5,6),
    arrival_at: DateTime.new(2018,4,6,8,10,12),
    individual_price:  105,
    group_price_per_user_cents: 55,
    station_departure: "Bordeaux",
    station_arrival: "Paris"
  )
  trip.save!
end


puts 'Generating test user'

usertest = User.new(
  first_name: 'Carlos',
  last_name: 'Velasquez',
  email: 'test@test.fr',
  password: 'test1234',
  phone: '0607080990'
)
usertest.save!

puts 'Generating fake booking'
bookingtest = Booking.new(
  trip_id: 1,
  user_id: 1,
  status: "pending"
)
bookingtest.save!

admin = User.create(first_name: "test", last_name: "testlast", phone: "0651763675", email: "test@test.com", password: "test123")
admin.save!
puts "Test account: test@test.com : test123"

puts 'Finished!'


