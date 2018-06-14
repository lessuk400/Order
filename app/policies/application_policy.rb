# frozen_string_literal: true

class ApplicationPolicy
  def initialize(user, resource, **context)
    @user     = user
    @resource = resource
    @context  = context
  end

  private

  attr_reader :user, :resource, :context

  private *delegate(:admin?, to: :user, allow_nil: true)

  def act_as_assigned_user?(other_user = resource_user)
    user == other_user
  end

  def allowed
    true
  end

  def not_allowed
    false
  end

  def user_exists?
    user.present?
  end

  alias_method :index?,   :not_allowed
  alias_method :show?,    :not_allowed
  alias_method :create?,  :not_allowed
  alias_method :new?,     :create?
  alias_method :update?,  :not_allowed
  alias_method :edit?,    :update?
  alias_method :destroy?, :not_allowed
end
