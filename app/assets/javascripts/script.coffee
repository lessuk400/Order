$ ->
  $("#js_main").on "change", $("#js-food-item"),  ->
      $(".js-food-item").last().val(getDataPrice());
      $(".js-food-item").last().attr("min" : $(".js-food-item :selected").last().data("price"));


getDataPrice = () ->
  $(".js-food-item :selected").last().data("price")

setDataPrice = () ->
  $(".js-food-item :selected").last().data("price")
