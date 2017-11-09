require 'rails_helper'

RSpec.describe "household_items/show", type: :view do
  before(:each) do
    @household_item = assign(:household_item, HouseholdItem.create!(
      :year_purchase => 2,
      :description => "MyText",
      :street_name => "MyText",
      :postcode => "Postcode",
      :state => "State",
      :country => "Country",
      :transport_cost_cents => 3,
      :price_cents => 4,
      :item_image => "MyText",
      :seller => nil,
      :buyer => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Postcode/)
    expect(rendered).to match(/State/)
    expect(rendered).to match(/Country/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
