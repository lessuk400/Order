class Meal < ApplicationRecord
  belongs_to :food_item
<<<<<<< HEAD
  belongs_to :menu, inverse_of: :meals

  has_many :order_meals
  has_many :orders, through: :order_meals

=======
  belongs_to :menu
>>>>>>> 396c301... Wrodi pashe grobana forma
  accepts_nested_attributes_for :food_item
end
