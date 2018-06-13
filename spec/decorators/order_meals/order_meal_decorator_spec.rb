require 'rails_helper'

RSpec.describe OrderMealDecorator do
  subject { described_class.new(resource) }

  let(:order)    { create(:order, :full_order) }
  let(:resource) { build(:order_meal, 'first_meal', order: order) }

  describe '#related_food_items' do
    let(:food_item_name) { resource.meal.food_item.name }

    it 'returns related food items' do
      expect(subject.related_food_items.last).to include(food_item_name)
    end
  end

  describe '#menu' do
    let(:last_menu) { Menu.last }

    it 'returns Menu' do
      expect(subject.menu).to be_a Menu
    end

    it 'returns last Menu' do
      expect(subject.menu).to eq last_menu
    end
  end
end
