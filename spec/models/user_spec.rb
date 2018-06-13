require 'rails_helper'

RSpec.describe(User, type: :model) do

  context 'validation' do
    it { should validate_presence_of(:name)  }
    it { should validate_presence_of(:email) }
  end

  context 'associations' do
    it { should have_many(:orders).dependent(:destroy) }
  end
end
