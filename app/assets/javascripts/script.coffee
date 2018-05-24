<<<<<<< HEAD
<<<<<<< HEAD
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
=======
$(document).ready ->
  $("#js_main").on "change", $("#js_food_item"),  ->
      $(".js_food_item_price").last().val($(".js_food_item :selected").last().data("price"));
      $(".js_food_item_price").last().attr("min" : $(".js_food_item :selected").last().data("price"));
=======
$ ->
  $("#js_main").on "change", $("#js-food-item"),  ->
      $(".js-food-item").last().val(getDataPrice());
      $(".js-food-item").last().attr("min" : $(".js-food-item :selected").last().data("price"));
>>>>>>> 41ec95b... Code review


getDataPrice = () ->
  $(".js-food-item :selected").last().data("price")

<<<<<<< HEAD
###
      $("#food_item_price").attr({"min" : Object.values(temp)[$("#food_item").val()-1]});
      $("#food_item_price").val(Object.values(temp)[$("#food_item").val()-1]);
###


###
  $("#button_to_add_menu_item").click ->

    price = $("#food_item_price").val();
    template = `<div><p>${item}</p><p>${price}</p></div>`
    $("#asd_id").append(template);
    $("#food_item").val("");
    $("#food_item_price").val("");
    })
###
>>>>>>> 9f895c4... Simple_form_bootstrap rubocop
=======
setDataPrice = () ->
  $(".js-food-item :selected").last().data("price")
>>>>>>> 41ec95b... Code review
