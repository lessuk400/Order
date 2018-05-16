class RenameColumn < ActiveRecord::Migration[5.2]
  def change
    rename_column :food_items, :type, :mealType
  end
end
