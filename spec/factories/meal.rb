FactoryBot.define do
  factory :meal do
    price { Faker::Number.number(2).to_i }
    association :food_item

    trait :with_menu do
      after(:build) do |meal|
        meal.menu = create(:menu, :with_meals)
      end
    end

    FoodItem.meal_types.keys.each do |meal_type|
      trait(meal_type.to_sym) { association :food_item, factory: [:food_item, meal_type.to_sym] }
    end
  end
end
