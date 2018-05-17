class Menu < ApplicationRecord
  validates :name, presence: true
  # validates :price,

  has_many :meals
  has_many :food_items, through: :meals

  accepts_nested_attributes_for :meals
end
