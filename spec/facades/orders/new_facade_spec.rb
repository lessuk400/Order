require 'rails_helper'

RSpec.describe Orders::NewFacade do
  let(:result) { described_class.new() }

  describe '#order' do
    it 'returns order' do
      expect(result.order).to be_an Order
    end
  end

  describe '#saved?' do
    context 'order is valid' do
      it 'returns true' do
        allow(result.order).to receive(:persisted?).and_return(true)

        expect(result.saved?).to be true
      end
    end

    context 'order is invalid' do
      it 'returns false' do
        expect(result.saved?).to be false
      end
    end
  end

  describe '#menu' do
    before { create(:menu, :for_today, :with_meals) }

    it 'returns menu' do
      expect(result.menu).to be_a Menu
    end
  end

  describe '#meals' do
    let(:menu)  { create(:menu, :for_today, :with_meals) }
    let(:meals) { menu.meals }
    let(:meal)  { menu.meals.first }

    it 'returns menu' do
      allow(result).to receive(:meals).and_return meals

      expect(result.meals).to include meal
    end
  end
end