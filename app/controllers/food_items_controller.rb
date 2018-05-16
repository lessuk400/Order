class FoodItemsController < ApplicationController
  def index
    @foodItems = FoodItem.all
  end

  def new
    @foodItem = FoodItem.new
  end

  def create
    @foodItem = FoodItem.create(foodItems_params)
    redirect_to food_items_path
  end


  private
  def foodItems_params
    params.require(:food_item).permit(:name, :price, :mealType)
  end
end
