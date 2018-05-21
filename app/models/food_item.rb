class FoodItem < ApplicationRecord
  FIRST_MEAL = 'first_meal'.freeze
  MAIN_MEAL  = 'main_meal'.freeze
  DRINK      = 'drink'.freeze

  has_many :meals
  has_many :menus, through: :meals

  enum meal_type: {
    first_meal: FIRST_MEAL,
    main_meal:  MAIN_MEAL,
    drink:      DRINK
  }

  def self.all_meal_types
    FoodItem.meal_types
  end

  def self.generate_hash
    result = {}
    FoodItem.all.each do |item|
      result[item.name] = item.price
    end
    result
  end
end
