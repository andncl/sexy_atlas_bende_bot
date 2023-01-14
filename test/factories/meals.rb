FactoryBot.define do
  factory :meal do
    name { "Hack" }
    price { 3.4 } 

    trait :with_cook do
      association eater
    end
  end
end
