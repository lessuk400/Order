class MenusController < ApplicationController
  def index
    @menus = Menu.all
    authorize @menus
  end

  def new
    if Date.today.saturday? || Date.today.sunday?
      flash[:warning] = 'Today is weekends. No need for menu'
      redirect_to root_path
    end
    if Menu.last.date == Date.today
      flash[:warning] = 'You have already created menu for today.'
      redirect_to root_path
    end
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
