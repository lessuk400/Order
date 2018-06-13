# frozen_string_literal: true

module Orders
  class NewFacade
    def initialize(**params)
      @order = params[:order]
    end

    def order
      @order ||= Order.new(order_meals: new_order_meals).decorate
    end

    def order_saved?
      order.persisted?
    end

    def menu
      @menu ||= Menu.today_menu
    end

    def meals
      @meals ||= menu.meals
    end

    private

    def new_order_meals
      FoodItem.meal_types.keys.map(&method(:built_meal))
    end

    def built_meal(meal_type)
      OrderMeal.new(meal_attributes: meal_attributes(meal_type))
    end

    def meal_attributes(meal_type)
      {
          menu:                 menu,
          food_item_attributes: { meal_type: meal_type }
      }
    end
  end
end
