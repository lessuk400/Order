# frozen_string_literal: true

module Menus
  class NewFacade
    def initialize(**params)
      @menu = params[:menu]
    end

    def menu
      @menu ||= Menu.new(meals: new_meals)
    end

    def menu_saved?
      menu.persisted?
    end

    def food_items
      @food_items ||= FoodItem.all
    end

    def weekend?
      Date.today.saturday? || Date.today.sunday?
    end

    def menu_already_exist?
      Menu.last&.date == Date.today
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
