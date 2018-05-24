module Menus
  class NewFacade
    attr_accessor :menu, :food_items

    def menu
      @menu ||= Menu.new(meals: new_meals)
    end

    def food_items
      @food_items ||= FoodItem.all
    end

<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 41ec95b... Code review
    def weekend?
      Date.today.saturday? || Date.today.sunday?
    end

    def menu_already_exist?
      Menu.last&.date == Date.today
    end

<<<<<<< HEAD
=======
>>>>>>> 9ac2da0... Added coffe to menu form
=======
>>>>>>> 41ec95b... Code review
    private

    def new_meals
      Array[new_meal]
    end

    def new_meal
      Meal.new
    end
  end
end
