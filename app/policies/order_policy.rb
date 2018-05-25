# frozen_string_literal: true

class MenuPolicy < ApplicationPolicy
  alias_method :index?,  :user_exists?
  alias_method :create?, :user_exists?
  alias_method :new?,    :create?

  public :index?, :create?
end
