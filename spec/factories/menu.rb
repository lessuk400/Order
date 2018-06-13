FactoryBot.define do
  factory :menu do
    date { Faker::Date.backward(10) }
    name { Faker::Name.name         }

    trait :with_meals do
      transient do
         meal_count  1
      end
      after(:build) do |menu, evaluator|
        evaluator.meal_count.times do
          FoodItem.meal_types.keys.each do |meal_type|
            menu.meals << build(:meal, meal_type.to_sym)
          end
        end
      end
    end

    trait :for_today do
      date { Date.today }
    end
  end
end