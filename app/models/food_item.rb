class FoodItem < ApplicationRecord
  FIRST_MEAL = 'first_meal'.freeze
  MAIN_MEAL  = 'main_meal'.freeze
  DRINK      = 'drink'.freeze

  validates :name, presence: true, uniqueness: {case_sensetive: true}, length: { maximum: 20, minimum: 3 }
  validates :price, presence: true, numericality: true
  validates :meal_type, presence: true
  validates :description, presence: true, length: { maximum: 100, minimum: 10 }

  has_many :meals, dependent: :destroy
  has_many :menus, through: :meals

  enum meal_type: {
    first_meal: FIRST_MEAL,
    main_meal:  MAIN_MEAL,
    drink:      DRINK
  }
end
