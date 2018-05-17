class Meal < ApplicationRecord
  belongs_to :food_item
<<<<<<< HEAD
  belongs_to :menu, inverse_of: :meals

  has_many :order_meals
  has_many :orders, through: :order_meals

=======
  belongs_to :menu
<<<<<<< HEAD
>>>>>>> 396c301... Wrodi pashe grobana forma
=======


  has_many :orders
  has_many :order_meals, through: :orders


>>>>>>> 02a7fd6... Orders with OrderMeals
  accepts_nested_attributes_for :food_item
end
