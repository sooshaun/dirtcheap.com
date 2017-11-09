class AddCityToHouseholdItem < ActiveRecord::Migration[5.1]
  def change
    add_column :household_items, :city, :string
  end
end
