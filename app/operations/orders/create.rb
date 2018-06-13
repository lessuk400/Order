# frozen_string_literal: true

module Orders
  class Create < Callable
    def initialize(user_id = nil, params = {})
      @user_id      = user_id
      @order_params = params
    end

    def call
      Orders::NewFacade.new(order: order)
    end

    private

    attr_reader :order_params, :user_id

    def order
      Order.create(creation_params).decorate
    end

    def creation_params
      order_params.merge(user_id: user_id)
    end
  end
end
