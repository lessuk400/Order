$(document).ready(function() {
  $temp = $("#myForm").data();
  $("#food_item").on("change", function() {
    $("#food_item_price").attr({"min" : Object.values($temp)[$("#food_item").val()-1]});
    $("#food_item_price").val(Object.values($temp)[$("#food_item").val()-1]);

    })


  $("#button_to_add_menu_item").click(function(){
    $item = $("#food_item option:selected").text();
    $price = $("#food_item_price").val();
    var template = `<div><p>${$item}</p><p>${$price}</p></div>`
    $("#asd_id").append(template);
    $("#food_item").val("");
    $("#food_item_price").val("");
    })
})
