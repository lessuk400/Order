# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  include Pundit

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    redirect_to(
      request.referrer || root_path,
      alert: t('menus_messages.new.messages.not_admin')
    )
  end

  def require_login
    redirect_to 'new_user_registration_path' unless current_user&.id
  end
end
