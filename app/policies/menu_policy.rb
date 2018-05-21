class MenuPolicy < ApplicationPolicy
  def index?
    true
  end

  def new?
<<<<<<< HEAD
    user&.admin?
=======
    user.has_role? :admin if !user.nil?
>>>>>>> 1b0a9e6... Added pundit
  end
end
