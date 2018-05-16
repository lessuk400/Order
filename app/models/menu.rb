class Menu < ApplicationRecord
<<<<<<< HEAD
  validates :name, presence: true

  has_many :meals, inverse_of: :menu, dependent: :destroy
  has_many :food_items, through: :meals

  accepts_nested_attributes_for :meals

  def start_time
    date # #Where 'start' is a attribute of type 'Date' accessible through MyModel's relationship
  end
=======
  has_many :meals
  has_many :food_items, through: :meals
  accepts_nested_attributes_for :meals
>>>>>>> 396c301... Wrodi pashe grobana forma
end
