class MenusController < ApplicationController

  def index
    @menus = Menu.all
    authorize @menus
  end

  def new
    @facade = Menus::NewFacade.new
    authorize @facade.menu
  end

  def create
    @menu = Menu.new menus_params
    if @menu.save
      redirect_to menus_path
    else
      render :new
    end
  end

  private

  def menus_params
    params
      .require(:menu)
      .permit(:name, :price, :date,
      meals_attributes: %i[price food_item_id _destroy])
  end
end
