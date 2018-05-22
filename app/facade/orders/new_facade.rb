module Orders
  class NewFacade
    def order
      @order ||= Order.new(order_meals: new_order_meals).decorate
    end

    def menu
      @menu ||= Menu.last
    end

    def meals
      @meals ||= menu.meals
    end

    private

    def new_order_meals
      FoodItem.meal_types.keys.map(&method(:built_meal))
    end

    def built_meal(meal_type)
      OrderMeal.new(
        meal_attributes: {
          menu:                 menu,
          food_item_attributes: { meal_type: meal_type }
        }
      )
    end
  end
end
