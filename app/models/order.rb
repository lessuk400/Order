class Order < ApplicationRecord
  belongs_to :user

<<<<<<< HEAD
  has_many :order_meals, dependent: :destroy
  has_many :meals, through: :order_meals

=======

  has_many :order_meals
  has_many :meals, through: :order_meals


>>>>>>> 02a7fd6... Orders with OrderMeals
  accepts_nested_attributes_for :order_meals
end
