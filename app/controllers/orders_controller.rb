# frozen_string_literal: true

class OrdersController < ApplicationController
  def index
    authorize(Order)
  end

  def new
    authorize(Order)

    @facade = Orders::NewFacade.new
  end

  def create
    authorize(Order)

    @order = Orders::Create.call(current_user.id, order_params)

    return redirect_to orders_path if @order.save

    render plain: t('orders.create.failed')
  end

  private

  def order_params
    params.require(:order).permit(order_meals_attributes: %i[meal_id])
  end
end
