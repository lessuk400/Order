# frozen_string_literal: true

class OrdersController < ApplicationController
  before_action :authenticate

  def index
    @orders = OrderDecorator.decorate_collection(Order.all)
  end

  def new
    @order = Orders::NewFacade.new
  end

  def create
    @order = Orders::Create.call(current_user.id, order_params)

    return redirect_to orders_path if @order.saved?

    render :new
  end

  private

  def order_params
    params.require(:order).permit(order_meals_attributes: %i[meal_id])
  end

  def authenticate
    authorize(Order)
  end
end
