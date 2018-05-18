module OrdersHelper
  def menu_items_for_selection
    Menu.last.meals
  end
end
