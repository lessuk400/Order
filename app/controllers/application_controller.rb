class ApplicationController < ActionController::Base
  include Pundit
  
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

<<<<<<< HEAD
  def user_not_authorized
    redirect_to request.referrer || root_path,
      flash: { warning: t('menus_messages.new.messages.not_admin')}
=======
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:username, :email, :password, :name, :password_confirmation, :remember_me, :avatar,
      :avatar_cache, :remove_avatar)
    end
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:username, :email, :password, :name, :password_confirmation, :current_password,
      :avatar, :avatar_cache, :remove_avatar)
    end
>>>>>>> fe98bb6... Done with Ruboco
  end
end
