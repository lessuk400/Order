# frozen_string_literal: true

module Menus
  class Create < Callable
    def initialize(params = {})
      @params = params
    end

    def call
      Menus::NewFacade.new(menu: menu)
    end

    private

    attr_reader :params

    def menu
      Menu.create(menu_params)
    end

    def menu_params
      params.merge(date: Date.today)
    end
  end
end
