require 'rails_helper'

RSpec.describe 'Food item creation', type: :feature do
  let(:food_item_params) { attributes_for(:food_item) }

  def submit_form
    fill_in 'food_item_name',        with: food_item_params[:name]
    fill_in 'food_item_price',       with: food_item_params[:price]
    fill_in 'food_item_description', with: food_item_params[:description]
    select food_item_params[:meal_type], from: 'food_item[meal_type]'

    click_on 'Create'
  end

  context 'user is admin' do
    let(:admin) { create(:admin) }

    before do
       sign_in admin

       visit new_food_item_path
     end

    context 'with valid params' do
      scenario 'allows food item creation' do
        submit_form

        expect(page).to have_content(food_item_params[:name])
      end

      scenario 'create a new food item' do
        expect{ submit_form }.to change(FoodItem, :count).by(1)
      end 
    end

    context 'with invalid params' do
      context 'without item name' do
        let(:food_item_params) { attributes_for(:food_item).merge(name: '') }

        scenario 'show form error' do
          submit_form

          expect(page).to have_content("Name can't be blank")
        end

        scenario 'doesn`t create a new food item' do
          expect{ submit_form }.not_to change(FoodItem, :count)
        end
      end

      context 'without item price' do
        let(:food_item_params) { attributes_for(:food_item).merge(price: nil) }

        scenario 'show form error' do
          submit_form

          expect(page).to have_content("Price can't be blank")
        end

        scenario 'doesn`t create a new food item' do
          expect{ submit_form }.not_to change(FoodItem, :count)
        end
      end

      context 'without item description' do
        let(:food_item_params) { attributes_for(:food_item).merge(description: '') }

        scenario 'show form error' do
          submit_form

          expect(page).to have_content("Description can't be blank")
        end

        scenario 'doesn`t create a new food item' do
          expect{ submit_form }.not_to change(FoodItem, :count)
        end
      end

      context 'without item meal_type' do
        let(:food_item_params) { attributes_for(:food_item).merge(meal_type: '') }

        scenario 'show form error' do
          submit_form

          expect(page).to have_content("Meal type can't be blank")
        end

        scenario 'doesn`t create a new food item' do
          expect{ submit_form }.not_to change(FoodItem, :count)
        end
      end

      context 'name is too long' do
        let(:food_item_params) { attributes_for(:food_item).merge(name: Faker::Lorem.paragraph)}

        scenario 'show form error' do
          submit_form

          expect(page).to have_content("Name is too long (maximum is 20 characters)")
        end

        scenario 'doesn`t create a new food item' do
          expect{ submit_form }.not_to change(FoodItem, :count)
        end
      end

      context 'name is too short' do
        let(:food_item_params) { attributes_for(:food_item).merge(name: 'ab')}

        scenario 'show form error' do
          submit_form

          expect(page).to have_content("Name is too short")
        end

        scenario 'doesn`t create a new food item' do
          expect{ submit_form }.not_to change(FoodItem, :count)
        end
      end

      context 'price is not digit' do
        let(:food_item_params) { attributes_for(:food_item).merge(price: 'aabc')}

        scenario 'show form error' do
          submit_form

          expect(page).to have_content("Price is not a number")
        end

        scenario 'doesn`t create a new food item' do
          expect{ submit_form }.not_to change(FoodItem, :count)
        end
      end
    end
  end

  context 'user is not admin' do
    let(:customer) { create(:user) }

    before do
      create(:admin)

      sign_in customer

      visit new_food_item_path
    end

      scenario 'no permission' do
        expect(page).to have_content("You are not admin of this lunch")
      end
    end
  end
