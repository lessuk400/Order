require 'rails_helper'

RSpec.describe Menus::Create do
  let(:result) { described_class.new() }

  describe '#call' do
    it 'returns Menus NewFacade' do
      expect(result.call).to be_a Menus::NewFacade
    end
  end
end