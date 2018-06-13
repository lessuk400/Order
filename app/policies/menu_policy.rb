# frozen_string_literal: true

class MenuPolicy < ApplicationPolicy
  alias_method :index?,  :user_exists?
  alias_method :create?, :admin?
  alias_method :new?,    :create?

  public :index?, :new?, :create?
end
