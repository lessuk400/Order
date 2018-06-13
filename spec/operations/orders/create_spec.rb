require 'rails_helper'

RSpec.describe Orders::Create do
  let(:result) { described_class.new() }

  describe '#call' do
    it 'returns Orders NewFacade' do
      expect(result.call).to be_a Orders::NewFacade
    end
  end
end