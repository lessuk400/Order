class MenuPolicy < ApplicationPolicy
  def index?
    true
  end

  def new?
    user&.admin?
  end
end
