class AddTransportCostCentsAndPriceCentsToHouseholdItem < ActiveRecord::Migration[5.1]
  def change
    add_column :household_items, :transport_cost_cents, :decimal
    add_column :household_items, :price_cents, :decimal
  end
end
