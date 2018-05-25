class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:username, :email, :password, :name, :password_confirmation, :remember_me, :avatar,
      :avatar_cache, :remove_avatar)
    end
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:username, :email, :password, :name, :password_confirmation, :current_password,
      :avatar, :avatar_cache, :remove_avatar)
    end
  end
end
