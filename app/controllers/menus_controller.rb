class MenusController < ApplicationController
  def index
    @menus = Menu.all
  end

  def new
    @menu = Menu.new
    @menu.meals.build
  end

  def create
    @menu = Menu.new (menus_params)
    if @menu.save
      redirect_to menus_path
    else
      render :new
    end
  end

  def edit

  end

  private
  def menus_params
    params
    .require(:menu)
    .permit(:name, :price, :date,
    meals_attributes: [:price, :id, :food_item_id])
  end
end
