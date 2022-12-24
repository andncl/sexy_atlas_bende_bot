FactoryBot.define do
  factory :user do
    first_name { "User_first" }
    last_name { "User_last" }
    balance { 1.5 }

    trait :called_hans do
      first_name { "Hans" }
    end
  end
end
