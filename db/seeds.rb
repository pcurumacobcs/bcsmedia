# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

User.create(
  name: 'root',
  last_name: 'dev',
  username: 'root',
  email: 'admin@batrescs.com',
  password_digest: '12345678',
  status: '1'
)

User.create(
  name: 'eduardo',
  last_name: 'llamas',
  username: 'ellamas',
  email: 'ellamas@batrescs.com',
  password_digest: '12345678',
  status: '1'
)

i = 0
loop do
  i += 1
  Location.create(
    name: Faker::Name.name,
    address: 'Ciudad de Guatemala',
    location_type_id: 1,
    business_email: Faker::Internet.email,
    lat: '0',
    lng: '0',
    status: 1
  )
  if i == 15
    break       # this will cause execution to exit the loop
  end
end


puts "Seeds executed"