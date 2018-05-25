class SomeNewMigration < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :order_meals_id
  end
end
