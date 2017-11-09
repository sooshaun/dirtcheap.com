class AddLatitudeAndLongitudeToHouseholdItems < ActiveRecord::Migration[5.1]
  def change
    add_column :household_items, :latitude, :decimal, precision: 10, scale: 6
    add_column :household_items, :longitude, :decimal, precision: 10, scale: 6
  end
end
