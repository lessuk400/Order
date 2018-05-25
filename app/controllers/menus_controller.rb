# frozen_string_literal: true

class MenusController < ApplicationController
  def index
    authorize(Menu)

    @menus = Menu.all
  end

  def new
    authorize(Menu)

    @facade = Menus::NewFacade.new

    redirect_weekend    if @facade.menu_already_exist?
    redirect_menu_exist if @facade.weekend?
  end

  def create
    authorize(Menu)

    @menu = Menu.new(menus_params)

    return redirect_to menus_path if @menu.save

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
    redirect_to root_path, alert: t('menus_messages.new.messages.weekends')
  end

  def redirect_menu_exist
    redirect_to root_path, alert: t('menus_messages.new.messages.already_created')
  end
end
