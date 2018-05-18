class FoodItemsController < ApplicationController
  def index
    @food_items = FoodItem.all
  end

  def new
    @food_item = FoodItem.new
  end

  def create
    @food_item = FoodItem.create(food_items_params)
    redirect_to food_items_path
  end

  private

  def food_items_params
    params.require(:food_item).permit(:name, :price, :mealType)
  end
end
