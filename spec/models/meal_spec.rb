require 'rails_helper'

RSpec.describe(Meal, type: :model) do

  context 'associations' do
    it{ should have_many(:order_meals)                  }
    it{ should have_many(:orders).through(:order_meals) }
    it{ should belong_to(:food_item)                    }
    it{ should belong_to(:menu)                         }
    it{ should accept_nested_attributes_for(:food_item) }
  end

  context 'validations' do
    it{ should validate_presence_of(:menu)      }
    it{ should validate_presence_of(:food_item) }
  end

end