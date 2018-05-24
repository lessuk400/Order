class ApplicationController < ActionController::Base
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    redirect_to request.referrer || root_path,
      flash: { warning: t('menus_messages.new.messages.not_admin')}
  end
end
