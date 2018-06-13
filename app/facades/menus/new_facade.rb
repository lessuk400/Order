# frozen_string_literal: true

module Menus
  class NewFacade
    delegate :persisted?, to: :menu, prefix: true

    def initialize(**params)
      @menu = params[:menu]
    end

    def menu
      @menu ||= Menu.new(meals: meals)
    end

    def food_items
      @food_items ||= FoodItem.all
    end

    def weekend?
      Date.today.saturday? || Date.today.sunday?
    end

    def menu_already_exist?
      Menu.today_menu&.date == Date.today
    end

    private

    def meals
      @meals ||= Array[meal]
    end

    def meal
      @meal ||= Meal.new
    end
  end
end
