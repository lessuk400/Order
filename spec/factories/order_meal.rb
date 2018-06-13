FactoryBot.define do
  factory :order_meal do

    FoodItem.meal_types.keys.each do |meal_type|
      trait(meal_type.to_sym) { association :meal, factory: [:meal, :with_menu, meal_type.to_sym] }
    end
  end
end