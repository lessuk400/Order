class FoodItem < ApplicationRecord
  has_many :meals
  has_many :menus, through: :meals

  enum meal_type: %i[:first_meal :main_meal :drink]

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
