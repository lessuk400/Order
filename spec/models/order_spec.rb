require 'rails_helper'

RSpec.describe(Order, type: :model) do
  context 'validation' do
    it { should validate_presence_of(:user_id) }
  end

  context 'associations' do
    it { should have_many(:order_meals).dependent(:destroy) }
    it { should have_many(:meals).through(:order_meals)     }
    it { should accept_nested_attributes_for(:order_meals)  }
    it { should belong_to(:user)                            }
  end
end