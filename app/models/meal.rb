class Meal < ApplicationRecord
  belongs_to :food_item
  belongs_to :menu

  has_many :orders
  has_many :order_meals, through: :orders

  accepts_nested_attributes_for :food_item
end
