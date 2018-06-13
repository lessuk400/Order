FactoryBot.define do
  factory :order do
    user_id { create(:user).id }
    price { Faker::Number.number(2).to_i }

    trait :full_order do
      after(:build) do |order|
        menu = create(:menu, :with_meals, :for_today)

        menu.meals.each_with_index do |meal, index|
          order.order_meals << (create(:order_meal, FoodItem.meal_types.keys[index].to_sym, order: order))
        end
      end
    end
  end
end