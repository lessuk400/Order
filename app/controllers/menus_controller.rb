# frozen_string_literal: true

class MenusController < ApplicationController
  before_action :authenticate

  def index
    @menus = Menu.all
  end

  def new
    @facade = Menus::NewFacade.new

    return redirect_weekend if @facade.weekend?

    redirect_menu_exist if @facade.menu_already_exist?
  end

  def create
    @facade = Menus::Create.call(menus_params)

    return redirect_to menus_path if @facade.menu_persisted?

    render :new
  end

  private

  def menus_params
    params
      .require(:menu)
      .permit(
            :name,
            :price,
            :date,
            meals_attributes: %i[price food_item_id _destroy]
      )
  end

  def redirect_weekend
    redirect_to root_path, alert: t('menus_messages.new.messages.weekends')
  end

  def redirect_menu_exist
    redirect_to root_path, alert: t('menus_messages.new.messages.already_created')
  end

  def authenticate
    authorize(Menu)
  end
end
