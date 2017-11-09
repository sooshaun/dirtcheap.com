class RemoveItemImageFromHouseholdItem < ActiveRecord::Migration[5.1]
  def change
    remove_column :household_items, :item_image, :text
  end
end
