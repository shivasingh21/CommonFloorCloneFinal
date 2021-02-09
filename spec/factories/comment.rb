FactoryBot.define do
  factory :comment, class: Comment do
    rating { 2 }
    comment {"hello"}
    user_id { 3 }
    user {create(:user3)}
    property_id { 1 }
    property {create(:property)}
  end
end
