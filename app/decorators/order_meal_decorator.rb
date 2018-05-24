class OrderMealDecorator < ApplicationDecorator
  delegate :meal_type,        to: :food_item, allow_nil: true
  delegate :food_item, :menu, to: :meal,      allow_nil: true

  def related_food_items
    menu.meals.joins(:food_item).where(food_items: { meal_type: meal_type })
      .map { |obj| [obj.food_item.name, obj.id] }
  end
end
