class FoodItem < ApplicationRecord
  has_many :meals
  has_many :menus, through: :meals

  def self.all_meals
    types = []
    FoodItem.all.each do |item|
      types << item.mealType
    end
    types.uniq
  end

  def self.generate_hash
    result = {}
    FoodItem.all.each do |item|
      result[item.name] = item.price
    end
    result
  end
end
