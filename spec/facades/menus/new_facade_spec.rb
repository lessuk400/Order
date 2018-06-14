require 'rails_helper'

RSpec.describe Menus::NewFacade do
  let(:result) { described_class.new() }
  let(:resource)  { create_list(:food_item, 10) }
  let(:food_item) { resource.first }

  describe '#menu' do
    it 'returns new menu' do
      expect(result.menu).to be_a Menu
    end
  end

  describe '#menu_persisted?' do
    context 'menu valid' do
      it 'is available' do
        allow(result.menu).to receive(:persisted?).and_return(true)
        expect(result.menu_persisted?).to be true
      end
    end

    context 'menu invalid' do
      it 'is persisted' do
        expect(result.menu_persisted?).to be false
      end
    end
  end

  describe '#food_items' do
    it 'returns food items' do
      expect(result.food_items).to include food_item
    end
  end

  describe '#weekend?' do
    context 'weekdays' do
      it 'is valid' do
        allow(Date).to receive(:today).and_return(Date.new(2018, 6, 11))
        expect(result.weekend?).to be false
      end
    end

    context 'weekends' do
      it 'is invalid' do
        allow(Date).to receive(:today).and_return(Date.new(2018, 6, 9))
        expect(result.weekend?).to be true
      end
    end
  end

  describe '#menu_already_exist?' do
    context 'menu already exist' do
      before { create(:menu, :with_meals, :for_today) }

      it 'return true' do
        expect(result.menu_already_exist?).to be true
      end
    end

    context 'menu does not exist' do
      it 'return false' do
        expect(result.menu_already_exist?).to be false
      end
    end
  end
end