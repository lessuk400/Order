# frozen_string_literal: true

module Users
  class RegistrationsController < Devise::RegistrationsController
    before_action :configure_permitted_parameters, if: :devise_controller?

    protected

    def configure_permitted_parameters
      configure_signup_sanitizer
      configure_update_sanitizer
    end

    private

    def configure_signup_sanitizer
      devise_parameter_sanitizer.permit(:sign_up, &method(:permit_signup))
    end

    def permit_signup(user)
      user.permit(
        :username, :email, :password, :name, :password_confirmation,
        :remember_me, :avatar, :avatar_cache, :remove_avatar
      )
    end

    def configure_update_sanitizer
      devise_parameter_sanitizer.permit(:account_update, &method(:permit_update))
    end

    def permit_update(user)
      user.permit(
        :username, :email, :password, :name, :password_confirmation,
        :current_password, :avatar, :avatar_cache, :remove_avatar
      )
    end
  end
end
