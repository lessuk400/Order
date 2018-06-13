require 'rails_helper'

RSpec.describe FoodItemPolicy do
  subject { described_class.new(user, food_item) }

  let(:food_item) { FoodItem.new }

  context 'being a user' do
    before { create(:user) }
    let(:user) { create(:user) }

    it { is_expected.to permit_action(:index) }
    it { is_expected.to forbid_action(:create) }
    it { is_expected.to forbid_action(:new) }
  end

  context 'being an admin' do
    let(:user) { create(:user) }

    it { is_expected.to permit_action(:index) }
    it { is_expected.to permit_action(:create) }
    it { is_expected.to permit_action(:new) }
  end
end