# frozen_string_literal: true

class FoodItem < ApplicationRecord
  FIRST_MEAL      = 'first_meal'
  MAIN_MEAL       = 'main_meal'
  DRINK           = 'drink'
  MIN_NAME        = 3
  MAX_NAME        = 20
  MIN_DESCRIPTION = 10
  MAX_DESCRIPTION = 100

  has_many :meals, dependent: :destroy
  has_many :menus, through: :meals

  validates :name, presence:   true,
                   uniqueness: { case_sensitive: true },
                   length:     { maximum: MAX_NAME, minimum: MIN_NAME }

  validates :description, presence: true,
                          length:   { maximum: MAX_DESCRIPTION, minimum: MIN_DESCRIPTION }

  validates :meal_type, presence: true
  validates :price,     presence: true, numericality: true

  enum meal_type: {
    first_meal: FIRST_MEAL,
    main_meal:  MAIN_MEAL,
    drink:      DRINK
  }
end
