class Order < ApplicationRecord
  belongs_to :user

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
  has_many :order_meals, dependent: :destroy
  has_many :meals, through: :order_meals

=======

  has_many :order_meals
  has_many :meals, through: :order_meals


>>>>>>> 02a7fd6... Orders with OrderMeals
=======
  has_many :order_meals
=======
  has_many :order_meals, dependent: :destroy
>>>>>>> 8a4fae3... Fixes
=======
  has_many :order_meals, dependent: :destroy
>>>>>>> d1aaad3... Fixes
  has_many :meals, through: :order_meals

>>>>>>> fe98bb6... Done with Ruboco
  accepts_nested_attributes_for :order_meals
end
