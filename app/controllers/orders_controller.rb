class OrdersController < ApplicationController
  def new
    @facade = Orders::NewFacade.new
  end

  def create
    @order = Order.new order_params
    @order.user_id = current_user.id
    if @order.save
      redirect_to orders_path
    else
      render plain: 'Da zaebalo'
    end
  end

  private

  def order_params
    params
      .require(:order)
      .permit(order_meals_attributes: [:meal_id])
  end
end