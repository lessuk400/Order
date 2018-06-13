# frozen_string_literal: true

class Meal < ApplicationRecord
  belongs_to :food_item
  belongs_to :menu, inverse_of: :meals

  has_many :order_meals
  has_many :orders, through: :order_meals

  validates_presence_of :menu
  validates_presence_of :food_item

  accepts_nested_attributes_for :food_item
end
