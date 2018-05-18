class FoodItem < ApplicationRecord
<<<<<<< HEAD
<<<<<<< HEAD
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
=======
  has_many :menus
=======
  has_many :meals
>>>>>>> 02a7fd6... Orders with OrderMeals
  has_many :menus, through: :meals
<<<<<<< HEAD
>>>>>>> 396c301... Wrodi pashe grobana forma
=======

  #enum meal_type: [:first, :main, :drink]

  def self.all_meals
    types = []
    FoodItem.all.each do |item|
      types << item.mealType
    end
    types.uniq
  end

  def self.generate_hash
    result = {}
    FoodItem.all.each do |item|
      result[item.name] = item.price
    end
    result
  end
<<<<<<< HEAD


>>>>>>> 1b41b07... added some interface
=======
>>>>>>> fe98bb6... Done with Ruboco
end
