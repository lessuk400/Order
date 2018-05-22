module MenusHelper
  # TODO: read about pundit

  def food_items_for_select(food_items)
    food_items.map { |item| [item.name, item.id, data: { price: item.price }] }
  end

  def user_role_status current_user
    return 'You are admin of menu' if !current_user.nil? && current_user.has_role?(:admin)
    return 'Hello dear custommer' unless current_user.nil?
    'Hello. You should log in in our system'
  end
end
