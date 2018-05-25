class ChangeMealTypeFieldType < ActiveRecord::Migration[5.2]
  def change
    change_column :food_items, :meal_type, :integer
  end
end
