# frozen_string_literal: true

class OrderMeal < ApplicationRecord
  belongs_to :meal
  belongs_to :order

  accepts_nested_attributes_for :meal

  delegate :food_item, to: :meal, allow_nil: true
end
