FactoryBot.define do
  factory :food_item do
    name         { Faker::Lorem.characters(10)  }
    price        { Faker::Number.number(2).to_i }
    description  { Faker::Lorem.sentence        }
    meal_type    { FoodItem::DRINK              }

    FoodItem.meal_types.keys.each do |meal_type|
        trait(meal_type) { meal_type(meal_type) }
    end

    trait :drink do
      meal_type FoodItem::DRINK
    end

    trait :first_meal do
      meal_type FoodItem::FIRST_MEAL
    end

    trait :main_meal do
      meal_type FoodItem::MAIN_MEAL
    end
  end
end

