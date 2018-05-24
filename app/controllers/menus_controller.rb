class MenusController < ApplicationController
  def index
    @menus = Menu.all
  end

  def new
    authorize Menus::NewFacade.new.menu
    @facade = Menus::NewFacade.new
    redirect_to root_path, flash: {warning: t('menus_messages.new.messages.weekends')} if
                                                                                @facade.weekend?

    redirect_to root_path, flash: {warning: t('menus_messages.new.messages.already_created')} if
                                                                      @facade.menu_already_exist?
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
end
