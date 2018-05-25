module Orders
  class NewFacade
<<<<<<< HEAD
<<<<<<< HEAD
    def order
      @order ||= Order.new(order_meals: new_order_meals).decorate
    end

    def menu
      @menu ||= Menu.last
    end

    def meals
      @meals ||= menu.meals
=======
    attr_accessor :order, :meals

=======
>>>>>>> 393483a... Draper on orders
    def order
      @order ||= Order.new(order_meals: new_order_meals).decorate
    end

    def menu
      @menu ||= Menu.last
    end

    def meals
<<<<<<< HEAD
      @meals ||= Menu.last.meals
>>>>>>> 9ac2da0... Added coffe to menu form
=======
      @meals ||= menu.meals
>>>>>>> 393483a... Draper on orders
    end

    private

    def new_order_meals
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
      FoodItem.meal_types.keys.map(&method(:built_meal))
    end

    def built_meal(meal_type)
      OrderMeal.new(
        meal_attributes: {
          menu:                 menu,
          food_item_attributes: { meal_type: meal_type }
        }
      )
=======
      Array[new_order_meal]
=======
      Array[new_order_meal, new_order_meal, new_order_meal]
>>>>>>> d2cdaec... tried enum
    end

    def new_order_meal
      OrderMeal.new
>>>>>>> 9ac2da0... Added coffe to menu form
=======
      FoodItem.meal_types.keys.map(&method(:built_meal))
    end

    def built_meal(meal_type)
      OrderMeal.new(
        meal_attributes: {
          menu:                 menu,
          food_item_attributes: { meal_type: meal_type }
        }
      )
>>>>>>> 393483a... Draper on orders
    end
  end
end
