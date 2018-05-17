class Order < ApplicationRecord
  belongs_to :user

  has_many :order_meals
  has_many :meals, through: :order_meals

  accepts_nested_attributes_for :order_meals
end
