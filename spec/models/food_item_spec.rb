require 'rails_helper'

RSpec.describe(FoodItem, type: :model) do
  it 'has a valid factory' do
    expect(build(:food_item)).to be_valid
  end

  context 'validation' do

    it { should validate_presence_of(:name)                                      }
    it { should validate_uniqueness_of(:name)                                    }
    it { should validate_length_of(:name).is_at_least(3).is_at_most(20)          }
    it { should validate_presence_of(:price)                                     }
    it { should validate_numericality_of(:price)                                 }
    it { should validate_presence_of(:description)                               }
    it { should validate_length_of(:description).is_at_least(10).is_at_most(100) }
    it { should validate_presence_of(:meal_type)                                 }
  end

  context 'associations' do
    it { should have_many(:meals)                     }
    it { should have_many(:menus)                     }
    it { should have_many(:menus).through(:meals)     }
    it { should have_many(:meals).dependent(:destroy) }
  end
end
