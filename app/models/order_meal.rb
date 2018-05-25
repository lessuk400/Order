class OrderMeal < ApplicationRecord
  belongs_to :meal
  belongs_to :order

<<<<<<< HEAD
<<<<<<< HEAD
=======

>>>>>>> 02a7fd6... Orders with OrderMeals
=======
>>>>>>> fe98bb6... Done with Ruboco
  accepts_nested_attributes_for :meal
end
