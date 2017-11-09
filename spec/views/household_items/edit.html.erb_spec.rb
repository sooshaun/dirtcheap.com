require 'rails_helper'

RSpec.describe "household_items/edit", type: :view do
  before(:each) do
    @household_item = assign(:household_item, HouseholdItem.create!(
      :year_purchase => 1,
      :description => "MyText",
      :street_name => "MyText",
      :postcode => "MyString",
      :state => "MyString",
      :country => "MyString",
      :transport_cost_cents => 1,
      :price_cents => 1,
      :item_image => "MyText",
      :seller => nil,
      :buyer => nil
    ))
  end

  it "renders the edit household_item form" do
    render

    assert_select "form[action=?][method=?]", household_item_path(@household_item), "post" do

      assert_select "input[name=?]", "household_item[year_purchase]"

      assert_select "textarea[name=?]", "household_item[description]"

      assert_select "textarea[name=?]", "household_item[street_name]"

      assert_select "input[name=?]", "household_item[postcode]"

      assert_select "input[name=?]", "household_item[state]"

      assert_select "input[name=?]", "household_item[country]"

      assert_select "input[name=?]", "household_item[transport_cost_cents]"

      assert_select "input[name=?]", "household_item[price_cents]"

      assert_select "textarea[name=?]", "household_item[item_image]"

      assert_select "input[name=?]", "household_item[seller_id]"

      assert_select "input[name=?]", "household_item[buyer_id]"
    end
  end
end
