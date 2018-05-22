class MenusController < ApplicationController
  def index
<<<<<<< HEAD
    authorize Menu
=======
>>>>>>> 396c301... Wrodi pashe grobana forma
    @menus = Menu.all
    authorize @menus
  end

  def new
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
    authorize Menu
=======
    if Date.today.saturday? || Date.today.sunday?
      flash[:warning] = 'Today is weekends. No need for menu'
      redirect_to root_path
    end
    if Menu.last.date == Date.today
      flash[:warning] = 'You have already created menu for today.'
      redirect_to root_path
    end
>>>>>>> 4d9bc9a... Menu check
    @facade = Menus::NewFacade.new
<<<<<<< HEAD

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
=======
    @menu = Menu.new
    @menu.meals.build
=======
    @facade = Menus::NewFacade.new
>>>>>>> 9ac2da0... Added coffe to menu form
=======
    authorize @facade.menu
>>>>>>> 1b0a9e6... Added pundit
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
<<<<<<< HEAD
    .require(:menu)
    .permit(:name, :price, :date,
<<<<<<< HEAD
<<<<<<< HEAD
    meals_attributes: [:price, :id, :food_item_id])
>>>>>>> 396c301... Wrodi pashe grobana forma
=======
    meals_attributes: [:price, :id, :food_item_id, :_destroy])
>>>>>>> 1b41b07... added some interface
=======
    meals_attributes: [:price, :food_item_id, :_destroy])
>>>>>>> 02a7fd6... Orders with OrderMeals
=======
      .require(:menu)
      .permit(:name, :price, :date,
      meals_attributes: %i[price food_item_id _destroy])
>>>>>>> fe98bb6... Done with Ruboco
  end
end
