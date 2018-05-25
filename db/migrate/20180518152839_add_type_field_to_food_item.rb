class AddTypeFieldToFoodItem < ActiveRecord::Migration[5.2]
  def change
    add_column :food_items, :meal_type, :string
    rename_column :food_items, :mealType, :description
    remove_column :order_meals, :order_meals_id

  end
end
