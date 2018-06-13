require 'rails_helper'
require 'capybara/poltergeist'
Capybara.javascript_driver = :poltergeist

RSpec.describe 'Order creation', type: :feature, js: true do
  let(:menu) {create(:menu, :with_meals)}
  let(:order_params) { attributes_for(:order) }

  def submit_form
    find_all('.choose-item').each_with_index do |form, value|
      form.find('option:last-of-type').select_option
    end

    click_on('Create Order')
  end

  context 'logged in' do
    let(:customer) { create(:user) }

    before do
      sign_in customer

      create(:menu, :with_meals, :for_today, meal_count: 2)

      visit new_order_path
    end

    context 'with valid params' do
      scenario 'allows order creation' do
        submit_form

        expect(page).to have_content('This is order page')
      end

      it 'create new order' do
        expect{ submit_form }.to change(Order, :count)
      end

      it 'create new order_meal' do
        expect{ submit_form }.to change(OrderMeal, :count)
      end
    end

    context 'with invalid params' do
      scenario 'show order error' do
        click_on('Create Order')

        expect(page).to have_content('Should choose all meal types')
      end
    end
  end

  context 'not logged in' do
    before do
      visit new_order_path
    end

    scenario 'show sign in page' do
      expect(page).to have_content('Forgot your password?')
    end
  end
end