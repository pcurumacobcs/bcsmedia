# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

# make the first user
User.create!(
  name: 'root',
  last_name: 'dev',
  username: 'root',
  email: 'admin@batrescs.com',
  password: '12345678',
  status: 1
)

# make screen brand
5.times do |i|
  ScreenBrand.create(
    name: Faker::Company.name
  )
end

# make screen types
2.times do |i|
  ScreenType.create(
    name: Faker::Name.name
  )
end

orientations = [ "Horizontal", "Vertical" ]

5.times do |i|
  # make location type
  location_type = LocationType.new(
    name: Faker::Name.name,
  )
  location_type.save

  10.times do |e|
    # make locations
    location = Location.new(
      name: Faker::Name.name,
      address: 'Ciudad de Guatemala',
      location_type_id: location_type.id,
      business_email: Faker::Internet.email,
      lat: String(rand(14.5930298..14.648647)),
      lng: String(rand(-90.5394762..-90.5158425)),
      status: 1
    )
    location.save

    rand(10).times do |s|
      # make screens for location
      screen = Screen.new(
        screen_type_id: Integer(rand(1..5)),
        screen_brand_id: Integer(rand(1..2)),
        location_id: location.id,
        code: "001",
        model: "BCS",
        sku: "BCS-01",
        orientation: orientations[Integer(rand(0..1))],
        size_inches: "15'",
        description: "",
        status: 1,
      )
      screen.save
    end
  end
end


puts "Seeds executed"