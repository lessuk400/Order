class OrderMeal < ApplicationRecord
  belongs_to :meal
  belongs_to :order

<<<<<<< HEAD
=======

>>>>>>> 02a7fd6... Orders with OrderMeals
  accepts_nested_attributes_for :meal
end
