class AddTypeFieldToFoodItem < ActiveRecord::Migration[5.2]
  def change
<<<<<<< HEAD
    add_column :food_items, :meal_type, :string
    rename_column :food_items, :mealType, :description
    remove_column :order_meals, :order_meals_id

=======
    add_column :food_items, :meal_type, :integer
    rename_column :food_items, :mealType, :description
>>>>>>> fceb1e1... added enum
  end
end
