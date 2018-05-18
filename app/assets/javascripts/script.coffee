$(document).ready ->
  temp = $("#myForm").data();
  $("#food_item").on "change", ->
      $("#food_item_price").attr("min", 12);





###
      $("#food_item_price").attr({"min" : Object.values(temp)[$("#food_item").val()-1]});
      $("#food_item_price").val(Object.values(temp)[$("#food_item").val()-1]);
###


###
  $("#button_to_add_menu_item").click ->
    item = $("#food_item option:selected").text();
    price = $("#food_item_price").val();
    template = `<div><p>${item}</p><p>${price}</p></div>`
    $("#asd_id").append(template);
    $("#food_item").val("");
    $("#food_item_price").val("");
    })
###
