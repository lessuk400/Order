class OrderForm
  FOOD_ITEM_SELECTOR = '.js-food-item-get-price'
  FOOD_ITEM_DATA = '.js-food-item-set-price'
  FORM_SELECTOR = '#js-main'

  constructor: (selector = FORM_SELECTOR) ->
    @form = $(selector)

  init: ->
    @bindEvents()

  bindEvents: ->
    @form.on 'change', FOOD_ITEM_SELECTOR, ->
      price = $('option:selected', this).data('price')

      $(FOOD_ITEM_DATA, $(this).closest('.nested-fields')).attr('min' : price).val(price)

$ ->
  new OrderForm().init()
