FactoryBot.define do
  factory :user1, class: User do
    username {"temp1"}
    email {"temp1@gmail.com"}
    password {"temp1"}
  end

  factory :user2, class: User do
    username {"temp2"}
    email {"temp2@gmail.com"}
    password {"temp2"}
  end

  factory :user3, class: User do
    username {"temp3"}
    email {"temp3@gmail.com"}
    password {"temp3"}
  end
end
