FactoryBot.define do
  factory :food_item do
    name         { Faker::Lorem.characters(10)  }
    price        { Faker::Number.number(2).to_i }
    description  { Faker::Lorem.sentence        }
    meal_type    { FoodItem::DRINK              }

    FoodItem.meal_types.keys.each do |meal_type|
      trait(meal_type.to_sym) { meal_type(meal_type) }
    end
  end
end

