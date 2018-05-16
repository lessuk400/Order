class FoodItemsController < ApplicationController
  def index
<<<<<<< HEAD
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
    params.require(:food_item).permit(:name, :description, :price, :meal_type)
=======
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
>>>>>>> 396c301... Wrodi pashe grobana forma
  end
end
