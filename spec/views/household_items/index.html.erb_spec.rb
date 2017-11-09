require 'rails_helper'

RSpec.describe "household_items/index", type: :view do
  before(:each) do
    assign(:household_items, [
      HouseholdItem.create!(
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
      ),
      HouseholdItem.create!(
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
      )
    ])
  end

  it "renders a list of household_items" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Postcode".to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
    assert_select "tr>td", :text => "Country".to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
