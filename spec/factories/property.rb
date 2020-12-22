FactoryBot.define do
  factory :property do
    property_type {"Villa"}
    property_status {"Sold"}
    address {"address 123 123 123"}
    city {"Bhopal"}
    price {123123}
    area {123}
    owner_name {"Temp"}
    contact_person {"Temp01"}
    phone_number {9876543210}
  end
end
