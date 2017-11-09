require 'rails_helper'

RSpec.describe "HouseholdItems", type: :request do
  describe "GET /household_items" do
    it "works! (now write some real specs)" do
      get household_items_path
      expect(response).to have_http_status(200)
    end
  end
end
