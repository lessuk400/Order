class OrdersController < ApplicationController
<<<<<<< HEAD
  def index; end

  def new
    @facade = Orders::NewFacade.new
  end

  def create
    @order = Orders::Create.call(current_user.id, order_params)
    redirect_to orders_path and return if @order.save
    render plain: 'Something gone wrong'
=======
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
>>>>>>> 02a7fd6... Orders with OrderMeals
  end

  private

  def order_params
<<<<<<< HEAD
    params.require(:order).permit(order_meals_attributes: %i[meal_id])
=======
    params
    .require(:order)
    .permit(
      order_meals_attributes: [:meal_id])
>>>>>>> 02a7fd6... Orders with OrderMeals
  end
end
