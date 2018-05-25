# frozen_string_literal: true

module MenusHelper
  def food_items_for_select(food_items)
    food_items.map { |item| [item.name, item.id, data: { price: item.price }] }
  end

  def user_role_status(current_user)
    return t('menus_messages.new.helpers.admin') if current_user.admin?

    return t('menus_messages.new.helpers.customer') unless current_user
  end
end
