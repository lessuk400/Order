module MenusHelper
  # TODO: read about pundit

  def food_items_for_select(food_items)
    food_items.map { |item| [item.name, item.id, data: { price: item.price }] }
  end

  def user_role_status(current_user)
    return t('menus_messages.new.helpers.admin') if current_user&.has_role? :admin

    return t('menus_messages.new.helpers.customer') unless current_user.nil?
  end
end
