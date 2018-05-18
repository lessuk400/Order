$(document).ready ->
  $("#js_main").on "change", $("#js_food_item"),  ->
      $(".js_food_item_price").last().val($(".js_food_item :selected").last().data("price"));
      $(".js_food_item_price").last().attr("min" : $(".js_food_item :selected").last().data("price"));



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
