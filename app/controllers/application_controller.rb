# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit
  before_action :authenticate_user!

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    redirect_to(
      request.referrer || root_path,
      alert: t('menus_messages.new.messages.not_admin')
    )
  end

  def require_login
    redirect_to new_user_registration_path unless current_user
  end
end
