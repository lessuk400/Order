class UpsChangeMealTypeFieldType < ActiveRecord::Migration[5.2]
  def change
    change_column :food_items, :meal_type, :string
  end
end
