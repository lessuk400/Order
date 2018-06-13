require 'rails_helper'
require 'capybara/poltergeist'
Capybara.javascript_driver = :poltergeist

RSpec.describe 'Menus creation', type: :feature, js: true do
  let(:menu_params) { attributes_for(:menu) }

  def submit_form
    fill_in 'menu_name', with: menu_params[:name]

    find('.add_fields').trigger('click')
    find('.add_fields').trigger('click')

    find_all('.js-food-item-get-price').each_with_index do |form, index|
      form.select(FoodItem.all[index].name)
    end

    find('#submit-button').trigger('click')
  end

  context 'with admin rights' do
    let(:admin) { create(:admin) }

    before do
      sign_in admin

      FoodItem.meal_types.keys.each do |meal_type|
        create(:food_item, meal_type.to_sym)
      end

      visit new_menu_path
    end

    context 'with valid params' do
      scenario 'allows menu creation' do
        submit_form

        expect(page).to have_content('Mon')
        expect(page).to have_content(FoodItem.first.name)
      end

      it 'creates menu' do
        submit_form

        expect{ sleep 0.1 }.to change(Menu, :count) #TODO - check this one
      end

      it 'creates meals' do
        submit_form

        expect{ sleep 0.1 }.to change(Meal, :count) #TODO - check this one
      end

      context 'menu already exist' do
        before { create(:menu, :with_meals, :for_today, meal_count: 2) }
        let(:menu_params) { attributes_for(:menu, :for_today) }

        scenario 'show menu error' do
          refresh

          expect(page).to have_content('You have already created menu for today.')
        end

        it "doesn`t create menu`" do
          expect{ refresh }.not_to change(Menu, :count)
        end

        it "doesn`t create meal`" do
          expect{ refresh }.not_to change(Meal, :count)
        end
      end
    end

    context 'with invalid params' do
      context 'without menu name' do
        let(:menu_params) { attributes_for(:menu).merge(name: '') }

        scenario 'show form error' do
          submit_form

          expect(page).to have_content("Name can't be blank")
        end

        it 'doesn`t create a new menu' do
          expect{ submit_form }.not_to change(Menu, :count)
        end
      end

      context 'without food item name' do
        scenario 'show form error' do
          fill_in 'menu_name', with: menu_params[:name]

          find('#submit-button').trigger('click')
          expect(page).to have_content('Please select food item')
        end
      end

      context 'without all meal types' do
        scenario 'show form error' do
          fill_in 'menu_name', with: menu_params[:name]

          select FoodItem.first.name, from: 'menu[meals_attributes][0][food_item_id]'

          find('#submit-button').trigger('click')
          expect(page).to have_content('Should choose all meal types')
        end

        scenario "doesn`t allow menu creation" do
          fill_in 'menu_name', with: menu_params[:name]

          expect do
            select FoodItem.first.name, from: 'menu[meals_attributes][0][food_item_id]'
          end.not_to change(Menu, :count)
        end
      end
    end
  end

  context 'with customer rigths' do
    let(:customer) { create(:user) }

    before do
      create(:admin)

      sign_in customer

      visit new_menu_path
    end

    scenario 'show error' do
      expect(page).to have_content('You are not admin of this lunch.')
    end
  end

  context 'without sign in' do
    before { visit new_menu_path }

    it 'show sign in page' do
      expect(page).to have_content('Log in')
    end
  end
end
