class FoodItemsController < ApplicationController
  def index
<<<<<<< HEAD
<<<<<<< HEAD
    @food_items = FoodItem.all
  end

  def new
    @food_item = FoodItem.new
  end

  def create
    @food_item = FoodItem.create(food_items_params)
<<<<<<< HEAD
    
=======

>>>>>>> 41ec95b... Code review
    redirect_to food_items_path
  end

  private

  def food_items_params
    params.require(:food_item).permit(:name, :description, :price, :meal_type)
=======
    @foodItems = FoodItem.all
=======
    @food_items = FoodItem.all
>>>>>>> fe98bb6... Done with Ruboco
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
<<<<<<< HEAD
    params.require(:food_item).permit(:name, :price, :mealType)
>>>>>>> 396c301... Wrodi pashe grobana forma
=======
    params.require(:food_item).permit(:name, :price, :meal_type)
>>>>>>> d2cdaec... tried enum
  end
end
