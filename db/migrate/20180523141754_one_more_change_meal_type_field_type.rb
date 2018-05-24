class OneMoreChangeMealTypeFieldType < ActiveRecord::Migration[5.2]
  def change
    add_reference :orders, :order_meals, index: true
  end
end
