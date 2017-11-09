class ChangeColumnTransportCostCentsInHouseholdItem < ActiveRecord::Migration[5.1]
  def change
    change_column :household_items, :transport_cost_cents, :float
    change_column :household_items, :price_cents, :float
  end
end
