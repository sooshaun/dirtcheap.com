class AddItemImageDataToHouseholdItem < ActiveRecord::Migration[5.1]
  def change
    add_column :household_items, :item_image_data, :text
  end
end
