class OrderForm
  FOOD_ITEM_SELECTOR = '.js-food-item-get-price'
  FOOD_ITEM_DATA = '.js-food-item-set-price'
  FORM_SELECTOR = '#js-main'

  constructor: (@form) ->
    @form = $(FORM_SELECTOR)
    console.log("#{@form}")

  init: ->
    @bindEvents()

  bindEvents: ->
    @form.on 'change', FOOD_ITEM_SELECTOR, ->
      price = $("#{FOOD_ITEM_SELECTOR} :selected").last().data('price')
      console.log("#{price}")
      $("#{FOOD_ITEM_DATA}").last().attr("min" : price).val(price)

$ ->
  new OrderForm('#js-main').init()
