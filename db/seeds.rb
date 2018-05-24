# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'



Booking.destroy_all
Trip.destroy_all
User.destroy_all
p "destroy all"

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
p Trip.count

puts 'Generating test user'

usertest = User.new(
  first_name: 'Carlos',
  last_name: 'Velasquez',
  email: 'test@test.fr',
  password: 'test1234',
  phone: '0607080990',
  admin: true,
)
usertest.save!

puts 'Finished!'


