# frozen_string_literal: true

class FoodItemsController < ApplicationController
  before_action :authenticate

  def index
    @food_items = FoodItem.all
  end

  def new
    @food_item = FoodItem.new
  end

  def create
    @food_item = FoodItem.new(food_items_params)

    return redirect_to food_items_path if @food_item.save

    render new_food_item_path
  end

  private

  def food_items_params
    params.require(:food_item).permit(:name, :description, :price, :meal_type)
  end

  def authenticate
    authorize(FoodItem)
  end
end
