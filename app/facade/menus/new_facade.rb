module Menus
  class NewFacade
    attr_accessor :menu, :food_items

    def menu
      @menu ||= Menu.new(meals: new_meals)
    end

    def food_items
      @food_items ||= FoodItem.all
    end

    private

    def new_meals
      Array[new_meal]
    end

    def new_meal
      Meal.new
    end
  end
end
