# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :user

  has_many :order_meals, dependent: :destroy
  has_many :meals, through: :order_meals

  accepts_nested_attributes_for :order_meals
  validates :user_id, presence: true
  validates :order_meals, with_all_meal_types: true
end
