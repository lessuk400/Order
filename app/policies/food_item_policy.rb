# frozen_string_literal: true

class FoodItemPolicy < ApplicationPolicy
  alias_method :index?,  :user_exists?
  alias_method :create?, :admin?
  alias_method :new?,    :create?

  public :index?, :create?
end
