class Meal < ApplicationRecord
  belongs_to :food_item
<<<<<<< HEAD
<<<<<<< HEAD
  belongs_to :menu, inverse_of: :meals

  has_many :order_meals
  has_many :orders, through: :order_meals
<<<<<<< HEAD
<<<<<<< HEAD

=======
  belongs_to :menu
<<<<<<< HEAD
>>>>>>> 396c301... Wrodi pashe grobana forma
=======
=======
  belongs_to :menu, inverse_of: :meals
>>>>>>> 41ec95b... Code review

  has_many :orders
  has_many :order_meals, through: :orders
=======
>>>>>>> 8a4fae3... Fixes
=======
>>>>>>> d1aaad3... Fixes

<<<<<<< HEAD

>>>>>>> 02a7fd6... Orders with OrderMeals
=======
>>>>>>> fe98bb6... Done with Ruboco
  accepts_nested_attributes_for :food_item
end
