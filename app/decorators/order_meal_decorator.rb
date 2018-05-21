class OrderMealDecorator < ApplicationDecorator
  delegate :meal_type,        to: :food_item, allow_nil: true
  delegate :food_item, :menu, to: :meal,      allow_nil: true

  def related_food_items
    menu.food_items.where(meal_type: meal_type)
  end
end
