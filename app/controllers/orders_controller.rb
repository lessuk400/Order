class OrdersController < ApplicationController
  def index; end

  def new
    @facade = Orders::NewFacade.new
  end

  def create
    @order = Orders::Create.call(current_user.id, order_params)
    redirect_to orders_path and return if @order.save
    render plain: 'Something gone wrong'
  end

  private

  def order_params
    params.require(:order).permit(order_meals_attributes: %i[meal_id])
  end
end
