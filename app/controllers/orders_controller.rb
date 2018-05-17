class OrdersController < ApplicationController
  def index

  end

  def new
    @order = Order.new
    3.times {@order.order_meals.build}
  end

  def create
    @order = Order.new(order_params)
    @order.user_id = current_user.id
    if @order.save
      redirect_to orders_path
    else
      render plain: "Da zaebalo"
    end
  end

  private

  def order_params
    params
    .require(:order)
    .permit(
      order_meals_attributes: [:meal_id])
  end
end
