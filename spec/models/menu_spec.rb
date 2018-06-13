require 'rails_helper'

RSpec.describe(Menu, type: :model) do

  context 'validation' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:date) }
  end

  context 'associations' do
    it { should have_many(:meals).dependent(:destroy)  }
    it { should have_many(:food_items).through(:meals) }
    it { should accept_nested_attributes_for(:meals)   }
  end
end