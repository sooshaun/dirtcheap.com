require 'rails_helper'

RSpec.describe "profiles/new", type: :view do
  before(:each) do
    assign(:profile, Profile.new(
      :first_name => "MyString",
      :last_name => "MyString",
      :bsb => "MyString",
      :account_number => "MyString",
      :privacy => false,
      :avatar => "MyText",
      :user => nil
    ))
  end

  it "renders new profile form" do
    render

    assert_select "form[action=?][method=?]", profiles_path, "post" do

      assert_select "input[name=?]", "profile[first_name]"

      assert_select "input[name=?]", "profile[last_name]"

      assert_select "input[name=?]", "profile[bsb]"

      assert_select "input[name=?]", "profile[account_number]"

      assert_select "input[name=?]", "profile[privacy]"

      assert_select "textarea[name=?]", "profile[avatar]"

      assert_select "input[name=?]", "profile[user_id]"
    end
  end
end
