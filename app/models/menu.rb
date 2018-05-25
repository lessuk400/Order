# frozen_string_literal: true

class Menu < ApplicationRecord
  has_many :meals, inverse_of: :menu, dependent: :destroy
  has_many :food_items, through: :meals

  accepts_nested_attributes_for :meals

  validates :name, presence: true
end
