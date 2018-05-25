class OrdersController < ApplicationController
<<<<<<< HEAD
<<<<<<< HEAD
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

=======
>>>>>>> fe98bb6... Done with Ruboco
=======
  def index; end

>>>>>>> 41ec95b... Code review
  def new
    @facade = Orders::NewFacade.new
  end

  def create
<<<<<<< HEAD
    @order = Order.new order_params
    @order.user_id = current_user.id
    if @order.save
      redirect_to orders_path
    else
      render plain: 'Da zaebalo'
    end
>>>>>>> 02a7fd6... Orders with OrderMeals
=======
    @order = Orders::Create.call(current_user.id, order_params)
    redirect_to orders_path and return if @order.save
    render plain: 'Something gone wrong'
>>>>>>> 41ec95b... Code review
  end

  private

  def order_params
    params.require(:order).permit(order_meals_attributes: %i[meal_id])
<<<<<<< HEAD
=======
    params
<<<<<<< HEAD
<<<<<<< HEAD
    .require(:order)
    .permit(
      order_meals_attributes: [:meal_id])
>>>>>>> 02a7fd6... Orders with OrderMeals
=======
      .require(:order)
      .permit(order_meals_attributes: [:meal_id])
>>>>>>> fe98bb6... Done with Ruboco
=======
      .require(:order).permit(order_meals_attributes: %i[meal_id])
>>>>>>> 41ec95b... Code review
=======
>>>>>>> 8a4fae3... Fixes
  end
end
