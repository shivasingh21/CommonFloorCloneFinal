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

User.create(username: 'admin', email: 'admin@commonfloor.com', password: "password", admin: true)

User.create(username: 'shiva', email: 'shiva@email.com', password: "password")
User.create(username: 'raja', email: 'raja@email.com', password: "password")
User.create(username: 'rahul1', email: 'rahul1@email.com', password: "password")

Category.create(name: 'Apartment')
Category.create(name: 'House')
Category.create(name: 'Villa')

3.times do |i|
  property = Property.new
  property.property_type = "Apartment"
  property.property_status = "Rental"
  property.address = Faker::Address.full_address
  property.city = "Kolkata"
  property.price = Faker::Number.between(from: 10000, to: 10000000)
  property.area = Faker::Number.between(from: 500, to: 2000)
  property.owner_name = Faker::Name.unique.name
  property.contact_person = Faker::Name.unique.name
  property.phone_number = Faker::Number.number(digits: 10)
  property.user = User.find(Faker::Number.between(from: 2, to: 4))
  property.property_image.attach(io: open("https://picsum.photos/1920/1080"), filename: "#{i}_property_image.jpg")
  property.approved_status = true
  property.save!
end
3.times do |i|
  property = Property.new
  property.property_type = "Apartment"
  property.property_status = "Sold"
  property.address = Faker::Address.full_address
  property.city = "Bhopal"
  property.price = Faker::Number.between(from: 10000, to: 10000000)
  property.area = Faker::Number.between(from: 500, to: 2000)
  property.owner_name = Faker::Name.unique.name
  property.contact_person = Faker::Name.unique.name
  property.phone_number = Faker::Number.number(digits: 10)
  property.user = User.find(Faker::Number.between(from: 2, to: 4))
  property.property_image.attach(io: open("https://picsum.photos/1920/1080"), filename: "#{i}_property_image.jpg")
  property.save!
end
3.times do |i|
  property = Property.new
  property.property_type = "Villa"
  property.property_status = "Sold"
  property.address = Faker::Address.full_address
  property.city = "Siliguri"
  property.price = Faker::Number.between(from: 10000, to: 10000000)
  property.area = Faker::Number.between(from: 500, to: 2000)
  property.owner_name = Faker::Name.unique.name
  property.contact_person = Faker::Name.unique.name
  property.phone_number = Faker::Number.number(digits: 10)
  property.user = User.find(Faker::Number.between(from: 2, to: 4))
  property.property_image.attach(io: open("https://picsum.photos/1920/1080"), filename: "#{i}_property_image.jpg")
  property.approved_status = true
  property.save!
end
3.times do |i|
  property = Property.new
  property.property_type = "House"
  property.property_status = "Sold"
  property.address = Faker::Address.full_address
  property.city = "Indore"
  property.price = Faker::Number.between(from: 10000, to: 10000000)
  property.area = Faker::Number.between(from: 500, to: 2000)
  property.owner_name = Faker::Name.unique.name
  property.contact_person = Faker::Name.unique.name
  property.phone_number = Faker::Number.number(digits: 10)
  property.user = User.find(Faker::Number.between(from: 2, to: 4))
  property.property_image.attach(io: open("https://picsum.photos/1920/1080"), filename: "#{i}_property_image.jpg")
  property.approved_status = true
  property.save!
end
3.times do |i|
  property = Property.new
  property.property_type = "House"
  property.property_status = "Rental"
  property.address = Faker::Address.full_address
  property.city = "Ujjain"
  property.price = Faker::Number.between(from: 10000, to: 10000000)
  property.area = Faker::Number.between(from: 500, to: 2000)
  property.owner_name = Faker::Name.unique.name
  property.contact_person = Faker::Name.unique.name
  property.phone_number = Faker::Number.number(digits: 10)
  property.user = User.find(Faker::Number.between(from: 2, to: 4))
  property.property_image.attach(io: open("https://picsum.photos/1920/1080"), filename: "#{i}_property_image.jpg")
  property.save!
end
3.times do |i|
  property = Property.new
  property.property_type = "House"
  property.property_status = "Rental"
  property.address = Faker::Address.full_address
  property.city = "Pune"
  property.price = Faker::Number.between(from: 10000, to: 10000000)
  property.area = Faker::Number.between(from: 500, to: 2000)
  property.owner_name = Faker::Name.unique.name
  property.contact_person = Faker::Name.unique.name
  property.phone_number = Faker::Number.number(digits: 10)
  property.user = User.find(Faker::Number.between(from: 2, to: 4))
  property.property_image.attach(io: open("https://picsum.photos/1920/1080"), filename: "#{i}_property_image.jpg")
  property.approved_status = true
  property.save!
end
