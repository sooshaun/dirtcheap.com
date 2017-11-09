class RemoveTransportCostCentsAndPriceCentsToHouseholdItem < ActiveRecord::Migration[5.1]
  def change
    remove_column :household_items, :transport_cost_cents, :decimal
    remove_column :household_items, :price_cents, :decimal
  end
end
