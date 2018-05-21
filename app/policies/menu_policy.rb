class MenuPolicy < ApplicationPolicy
  def index?
    true
  end

  def new?
    user.has_role? :admin if !user.nil?
  end
end
