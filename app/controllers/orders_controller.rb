# frozen_string_literal: true

class OrdersController < ApplicationController
  def index
    authorize(Order)
  end

  def new
    authorize(Order)

    @order = Orders::NewFacade.new
  end

  def create
    authorize(Order)

    @order = Orders::Create.call(current_user.id, order_params)

    return redirect_to orders_path if @order.order_saved?

    render :new
  end

  private

  def order_params
    params.require(:order).permit(order_meals_attributes: %i[meal_id])
  end
end
