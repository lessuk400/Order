class ApplicationController < ActionController::Base
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
  include Pundit
  
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
=======
  before_action :configure_permitted_parameters, if: :devise_controller?
  include Pundit
>>>>>>> 1b0a9e6... Added pundit

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

=======
  include Pundit
>>>>>>> 41ec95b... Code review
=======
  include Pundit  

>>>>>>> 8a4fae3... Fixes
=======
  include Pundit  

>>>>>>> d1aaad3... Fixes
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    redirect_to request.referrer || root_path,
      flash: { warning: t('menus_messages.new.messages.not_admin')}
  end
end
