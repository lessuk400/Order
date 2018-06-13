require 'rails_helper'

RSpec.describe Orders::Create do
  let(:user_id) { create(:user).id }
  let(:result) { described_class.new(user_id) }

  describe '#call' do
    it 'returns Orders NewFacade' do
      expect(result.call).to be_a Orders::NewFacade
    end
  end
end