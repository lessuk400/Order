class MenusController < ApplicationController
  before_action :check_admin_role, except: :index

  def index
    @menus = Menu.all
  end

  def new
    @menu = Menu.new
    @menu.meals.build
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

  def check_admin?
    current_user.has_role? :admin
  end

  def check_admin_role
    unless check_admin?
      flash[:danger] = "You are not an Admin of this cafe"
      redirect_to menus_path
    end
  end
end
