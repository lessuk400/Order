# frozen_string_literal: true

class WithAllMealTypesValidator < ActiveModel::EachValidator
  def validate_each(object, _attribute, value)
    return if value.map { |value| value.food_item&.meal_type }
        .uniq.compact.size == FoodItem.meal_types.size

    object.errors.add(:meal, 'Should choose all meal types')
  end
end
