class CreateHouseholdItems < ActiveRecord::Migration[5.1]
  def change
    create_table :household_items do |t|
      t.integer :year_purchase
      t.text :description
      t.text :street_name
      t.string :postcode
      t.string :state
      t.string :country
      t.integer :transport_cost_cents
      t.integer :price_cents
      t.text :item_image
      t.references :seller, foreign_key: { to_table: :users }
      t.references :buyer, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
