class MealsController < ApplicationController
  def index
    @meals = Meal.all
  end

  def new
    @meal = Meal.new
  end

  def create
    @foodItem = FoodItem.first
    @meal = Meal.create(meals_params)
  end


  private
  def meals_params
    params.require(:meal).permit(:price, :name, :type)
  end
end
