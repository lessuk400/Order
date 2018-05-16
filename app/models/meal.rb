class Meal < ApplicationRecord
  belongs_to :food_item
  belongs_to :menu
  accepts_nested_attributes_for :food_item
end
