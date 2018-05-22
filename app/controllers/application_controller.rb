class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  include Pundit

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

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    flash[:warning] = 'You are not admin of this lunch.'
    redirect_to(request.referrer || root_path)
  end
end
