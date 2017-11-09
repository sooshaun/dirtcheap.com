class AddGenreAndTitleToHouseholdItem < ActiveRecord::Migration[5.1]
  def change
    add_column :household_items, :genre, :string
    add_column :household_items, :title, :string
  end
end
