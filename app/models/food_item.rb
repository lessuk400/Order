class FoodItem < ApplicationRecord
  has_many :menus
  has_many :menus, through: :meals
end
