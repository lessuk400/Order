require 'rails_helper'

RSpec.describe 'User registration', type: :feature do
  let(:user_params) { FactoryBot.attributes_for(:user) }

  before { visit new_user_registration_path }

  def submit_form
    fill_in 'user_name',                  with: user_params[:name]
    fill_in 'user_email',                 with: user_params[:email]
    fill_in 'user_password',              with: user_params[:password]
    fill_in 'user_password_confirmation', with: user_params[:password]

    click_on 'Sign up'
  end

  context 'with valid params' do
    scenario 'allows user to sign up' do
      submit_form

      expect(page).to have_content('Welcome')
    end

    it 'create a new user' do
      expect{ submit_form }.to change(User, :count).by(1)
    end
  end

  context 'with invalid params' do
    context 'without name' do
      let(:user_params) { FactoryBot.attributes_for(:user).merge(name: '') }

      scenario 'show form error' do
        submit_form

        expect(page).to have_content('You should enter your name')
      end

      it "doesn't create a new client" do
        expect{ submit_form }.not_to change(User, :count)
      end
    end

    context 'without email' do
      let(:user_params) { FactoryBot.attributes_for(:user).merge(email: '') }

      scenario 'show form error' do
        submit_form

        expect(page).to have_content("Email can't be blank")
      end

      it "doesn't create a new client" do
        expect{ submit_form }.not_to change(User, :count)
      end
    end

    context 'without password' do
      let(:user_params) { FactoryBot.attributes_for(:user).merge(password: nil) }

      scenario 'show form error' do
        submit_form

        expect(page).to have_content("Password can't be blank")
      end

      it "doesn't create a new client" do
        expect{ submit_form }.not_to change(User, :count)
      end
    end

    context 'password to short' do
      let(:user_params) { FactoryBot.attributes_for(:user).merge(password: '123') }

      scenario 'show form error' do
        submit_form

        expect(page).to have_content("Password is too short")
      end

      it "doesn't create a new client" do
        expect{ submit_form }.not_to change(User, :count)
      end
    end

    context 'email already in use' do
      let!(:existing_user) { FactoryBot.create(:user, email: user_params[:email]) }

      scenario 'show form error' do
        submit_form

        expect(page).to have_content("Email has already been taken")
      end

      it "doesn't create a new client" do
        expect{ submit_form }.not_to change(User, :count)
      end
    end
  end
end
