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
  password: 'test1234',
  phone: '0607180990',
  admin: false,
)

usertestc.save!

usertestc1 = User.new(
  first_name: 'Leonard',
  last_name: 'Cohen',
  email: 'leonarde@cohen.fr',
  password: 'test1235',
  phone: '0607280990',
  admin: false,
)

usertestc1.save!

usertestc2 = User.new(
  first_name: 'Leonard',
  last_name: 'Cohen',
  email: 'leonard1@cohen.fr',
  password: 'test1236',
  phone: '0607380990',
  admin: false,
)

usertestc2.save!

usertestc3 = User.new(
  first_name: 'Leonard',
  last_name: 'Cohen',
  email: 'leonard2@cohen.fr',
  password: 'test1237',
  phone: '0607480990',
  admin: false,
)

usertestc3.save!

usertestc4 = User.new(
  first_name: 'Leonard',
  last_name: 'Cohen',
  email: 'leonard3@cohen.fr',
  password: 'test1238',
  phone: '0607580990',
  admin: false,
)

usertestc4.save!
p "Done generating users"
puts "Admin >> test@test.fr : test123"
puts 'Finished!'


