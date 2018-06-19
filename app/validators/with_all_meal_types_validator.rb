# frozen_string_literal: true

class WithAllMealTypesValidator < ActiveModel::EachValidator
  def validate_each(object, _attribute, value)
    return if compare_size?(value)

    object.errors.add(:meal, 'Should choose all meal types')
  end

  private

  def compare_size?(value)
    value.map { |value| value.food_item&.meal_type }
      .uniq.compact.size == FoodItem.meal_types.size
  end
end
