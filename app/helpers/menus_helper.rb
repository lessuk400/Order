module MenusHelper
<<<<<<< HEAD
<<<<<<< HEAD
  def food_items_for_select(food_items)
    food_items.map { |item| [item.name, item.id, data: { price: item.price }] }
  end

  def user_role_status(current_user)
    return t('menus_messages.new.helpers.admin') if current_user.admin?

    return t('menus_messages.new.helpers.customer') unless current_user
  end
=======
>>>>>>> 396c301... Wrodi pashe grobana forma
=======
  def is_admin?
    current_user.has_role? :admin
  end  
>>>>>>> 9f895c4... Simple_form_bootstrap rubocop
end
