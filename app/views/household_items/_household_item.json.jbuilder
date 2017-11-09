json.extract! household_item, :id, :year_purchase, :description, :street_name, :postcode, :state, :country, :transport_cost_cents, :price_cents, :item_image, :seller_id, :buyer_id, :created_at, :updated_at
json.url household_item_url(household_item, format: :json)
