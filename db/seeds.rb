# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Booking.destroy_all
Trip.destroy_all
User.destroy_all
p "destroy all"

puts 'Generating test user'

usertest = User.new(
  first_name: 'Carlos',
  last_name: 'Velasquez',
  email: 'test@test.fr',
  password: 'test123',
  phone: '0607080990',
  admin: true,
)
usertest.save!

usertestc = User.new(
  first_name: 'Leonard',
  last_name: 'Cohen',
  email: 'leonard@cohen.fr',
  password: 'test123',
  phone: '0607080990',
  admin: false,
)

usertest.save!
puts 'Creating 10 fake trips and associated bookings'

1.times do
  trip = Trip.new(
    departure_at: DateTime.new(2018,6,4,05,23,0),
    arrival_at: DateTime.new(2018,6,4,18,2,0),
    individual_sncf_price_cents: 111,
    individual_group_price_cents: 56,
    station_departure: "Bordeaux",
    station_arrival: "Paris",
    train_number: "8480",
    duration: "2h30"
  )
  trip.save!
end

1.times do
  trip = Trip.new(
    departure_at: DateTime.new(2018,8,4,05,23,0),
    arrival_at: DateTime.new(2018,8,4,18,2,0),
    individual_sncf_price_cents: 200,
    individual_group_price_cents: 100,
    station_departure: "Marseille",
    station_arrival: "Paris",
    train_number: "8484",
    duration: "2h50"
  )
  trip.save!
end

1.times do
  booking = Booking.new(
    user: usertestc,
    trip: Trip.first,
    state: 0,
  )
  booking.save!
end

1.times do
  booking = Booking.new(
    user: User.first,
    trip: Trip.last,
    state: 1,
  )
  booking.save!
end


puts "Admin >> test@test.fr : test123"
puts 'Finished!'


