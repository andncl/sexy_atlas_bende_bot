FactoryBot.define do
  factory :eater do
    association :meal
    association :user
    first_name { "User_first" }

    trait :called_hans do
      first_name { "Hans" }
    end

    trait :is_cook do
      cooking { true }
    end

    trait :is_eater do
      cook { false }
    end
  end
end
