class AddingReferences < ActiveRecord::Migration[5.2]
  def change
    add_reference :meals, :menu, index: true
    add_reference :meals, :food_item, index: true
  end
end
