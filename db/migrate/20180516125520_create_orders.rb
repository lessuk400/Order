class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.references :user, index: true
      t.references :order_meals, index: true
      t.timestamps
    end
  end
end
