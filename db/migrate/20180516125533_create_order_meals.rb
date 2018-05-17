class CreateOrderMeals < ActiveRecord::Migration[5.2]
  def change
    create_table :order_meals do |t|
      t.references :meal, index: true
      t.references :order, index: true
      t.timestamps
    end
  end
end
