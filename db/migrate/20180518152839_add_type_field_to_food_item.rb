class AddTypeFieldToFoodItem < ActiveRecord::Migration[5.2]
  def change
<<<<<<< HEAD
<<<<<<< HEAD
    add_column :food_items, :meal_type, :string
    rename_column :food_items, :mealType, :description
    remove_column :order_meals, :order_meals_id

<<<<<<< HEAD
=======
    add_column :food_items, :meal_type, :integer
=======
    add_column :food_items, :meal_type, :string
>>>>>>> 756818d... Added calendar
    rename_column :food_items, :mealType, :description
>>>>>>> fceb1e1... added enum
=======
>>>>>>> 41ec95b... Code review
  end
end
