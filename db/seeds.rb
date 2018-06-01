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

puts "Admin >> test@test.fr : test123"
puts 'Finished!'


