class MenusController < ApplicationController
  def index
    authorize Menu
    @menus = Menu.all
  end

  def new
    authorize Menu
    @facade = Menus::NewFacade.new

    redirect_weekend

    redirect_menu_exist
  end

  def create
    @menu = Menu.new(menus_params)

    redirect_to menus_path and return if @menu.save
    
    render :new
  end

  private

  def menus_params
    params
      .require(:menu)
      .permit(:name,
              :price,
              :date,
              meals_attributes: %i[price food_item_id _destroy])
  end

  def redirect_weekend
    redirect_to root_path, flash: {
      warning: t('menus_messages.new.messages.weekends')
      } if @facade.weekend?
  end

  def redirect_menu_exist
    redirect_to root_path, flash: {
      warning: t('menus_messages.new.messages.already_created')
      } if @facade.menu_already_exist?
  end
end
