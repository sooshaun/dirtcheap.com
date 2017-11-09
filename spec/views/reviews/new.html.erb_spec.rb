require 'rails_helper'

RSpec.describe "reviews/new", type: :view do
  before(:each) do
    assign(:review, Review.new(
      :comment => "MyText",
      :rating => 1,
      :user => nil,
      :household_item => nil
    ))
  end

  it "renders new review form" do
    render

    assert_select "form[action=?][method=?]", reviews_path, "post" do

      assert_select "textarea[name=?]", "review[comment]"

      assert_select "input[name=?]", "review[rating]"

      assert_select "input[name=?]", "review[user_id]"

      assert_select "input[name=?]", "review[household_item_id]"
    end
  end
end
