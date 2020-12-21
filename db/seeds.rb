# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# #   Character.create(name: 'Luke', movie: movies.first)

property = Property.new
  property.property_type = "House"
  property.property_status = "Sold"
  property.address = "asfaasfafdsdc"
  property.city = "ascx"
  property.price = 786542
  property.area = 542
  property.owner_name = "wefsdcx"
  property.contact_person = "qefgrfd"
  property.phone_number = "7894561231"
  property.user = User.find(2)
  property.property_image.attach(io: open("https://picsum.photos/1920/1080"), filename: "1_property_image.jpg")
property.save!
