FactoryBot.define do
  factory :meal do
    name { "Hack" }
    price { 3.4 } 

    trait :with_cook
      eater, meal_id: meal.id 

    end
  end
end
