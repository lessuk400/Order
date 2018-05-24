class Menu < ApplicationRecord
  validates :name, presence: true

  has_many :meals, inverse_of: :menu
  has_many :food_items, through: :meals

  accepts_nested_attributes_for :meals

  def start_time
    date # #Where 'start' is a attribute of type 'Date' accessible through MyModel's relationship
  end
end
