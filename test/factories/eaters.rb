FactoryBot.define do
  factory :eater do
    association :meal
    association :user
    first_name { "User_first" }

    trait :called_hans do
      first_name { "Hans" }

    trait :is_cook
      cook { true }

    trait :is_eater
      cook { false }

    end
  end
end
