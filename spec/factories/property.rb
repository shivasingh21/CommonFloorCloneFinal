FactoryBot.define do
  factory :property, class: Property  do
    property_type {"Villa"}
    property_status {"Sold"}
    address {"address 123 123 123"}
    city {"Bhopal"}
    price {123123}
    area {123}
    owner_name {"Temp"}
    contact_person {"Temp01"}
    phone_number {9876543210}
    user_id { 1 }
    user {create(:user1)}
    after(:build) do |property|
      property.property_image.attach(io: File.open('spec/fixtures/test_image.png'), filename: 'test_image.png', content_type: 'image/png')
    end
  end
end
