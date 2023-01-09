FactoryBot.define do
  factory :cook do
    meal
    first_name { "MyString" }
    meal_id { 1 }
    user_if { 1 }
  end
end
