module Orders
  class NewFacade
    attr_accessor :order, :meals

    def order
      @order ||= Order.new(order_meals: new_order_meals)
    end

    def meals
      @meals ||= Menu.last.meals
    end

    private

    def new_order_meals
      Array[new_order_meal]
    end

    def new_order_meal
      OrderMeal.new
    end
  end
end
