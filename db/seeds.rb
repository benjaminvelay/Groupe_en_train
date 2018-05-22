# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'


puts 'Creating 10 fake trips'
10.times do
  trip = Trip.new(
    departure_at: DateTime.new(2018,2,3,4,5,6).iso8601('1616-04-23', Date::FRENCH),
    arrival_at: DateTime.new(2018,2,3,4,5,6),
    individual_price:  105,
    group_price_per_user: 55,
    station_departure: "Bordeaux",
    station_arrival: "Paris"

  )
  trip.save!
end
puts 'Finished!'


