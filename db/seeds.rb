# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# #   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
# 6.times do
#   User.create(username: Faker::Name.unique.name, email: Faker::Internet.email , password: "password")
# end

3.times do
  property = Property.new
  property.property_type = "Apartment"
  property.property_status = "Rental"
  property.address = Faker::Address.full_address
  property.city = "kolkata"
  property.price = Faker::Number.between(from: 10000, to: 10000000)
  property.area = Faker::Number.between(from: 500, to: 2000)
  property.owner_name = Faker::Name.unique.name
  property.contact_person = Faker::Name.unique.name
  property.phone_number = Faker::Number.number(digits: 10)
  property.user = User.find(Faker::Number.between(from: 2, to: 6))
  property.property_image.attach(io: open("https://picsum.photos/1920/1080"), filename: "1_property_image.jpg")
  property.save!
end
3.times do
  property = Property.new
  property.property_type = "Apartment"
  property.property_status = "Sold"
  property.address = Faker::Address.full_address
  property.city = "kolkata"
  property.price = Faker::Number.between(from: 10000, to: 10000000)
  property.area = Faker::Number.between(from: 500, to: 2000)
  property.owner_name = Faker::Name.unique.name
  property.contact_person = Faker::Name.unique.name
  property.phone_number = Faker::Number.number(digits: 10)
  property.user = User.find(Faker::Number.between(from: 2, to: 6))
  property.property_image.attach(io: open("https://picsum.photos/1920/1080"), filename: "1_property_image.jpg")
  property.save!
end
3.times do
  property = Property.new
  property.property_type = "Villa"
  property.property_status = "Sold"
  property.address = Faker::Address.full_address
  property.city = "kolkata"
  property.price = Faker::Number.between(from: 10000, to: 10000000)
  property.area = Faker::Number.between(from: 500, to: 2000)
  property.owner_name = Faker::Name.unique.name
  property.contact_person = Faker::Name.unique.name
  property.phone_number = Faker::Number.number(digits: 10)
  property.user = User.find(Faker::Number.between(from: 2, to: 6))
  property.property_image.attach(io: open("https://picsum.photos/1920/1080"), filename: "1_property_image.jpg")
  property.save!
end
3.times do
  property = Property.new
  property.property_type = "House"
  property.property_status = "Sold"
  property.address = Faker::Address.full_address
  property.city = "kolkata"
  property.price = Faker::Number.between(from: 10000, to: 10000000)
  property.area = Faker::Number.between(from: 500, to: 2000)
  property.owner_name = Faker::Name.unique.name
  property.contact_person = Faker::Name.unique.name
  property.phone_number = Faker::Number.number(digits: 10)
  property.user = User.find(Faker::Number.between(from: 2, to: 6))
  property.property_image.attach(io: open("https://picsum.photos/1920/1080"), filename: "1_property_image.jpg")
  property.save!
end
3.times do
  property = Property.new
  property.property_type = "House"
  property.property_status = "Rental"
  property.address = Faker::Address.full_address
  property.city = "kolkata"
  property.price = Faker::Number.between(from: 10000, to: 10000000)
  property.area = Faker::Number.between(from: 500, to: 2000)
  property.owner_name = Faker::Name.unique.name
  property.contact_person = Faker::Name.unique.name
  property.phone_number = Faker::Number.number(digits: 10)
  property.user = User.find(Faker::Number.between(from: 2, to: 6))
  property.property_image.attach(io: open("https://picsum.photos/1920/1080"), filename: "1_property_image.jpg")
  property.save!
end
