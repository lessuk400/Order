module MenusHelper
  # TODO: read about pundit

  def food_items_for_select(food_items)
    food_items.map { |item| [item.name, item.id, data: { price: item.price }] }
  end
end
