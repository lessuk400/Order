class MenuPolicy < ApplicationPolicy
  def index?
    true
  end

  def new?
<<<<<<< HEAD
<<<<<<< HEAD
    user&.admin?
=======
    user.has_role? :admin if !user.nil?
>>>>>>> 1b0a9e6... Added pundit
=======
    user&.has_role? :admin
>>>>>>> 4d9bc9a... Menu check
  end
end
