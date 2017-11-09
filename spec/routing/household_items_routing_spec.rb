require "rails_helper"

RSpec.describe HouseholdItemsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/household_items").to route_to("household_items#index")
    end

    it "routes to #new" do
      expect(:get => "/household_items/new").to route_to("household_items#new")
    end

    it "routes to #show" do
      expect(:get => "/household_items/1").to route_to("household_items#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/household_items/1/edit").to route_to("household_items#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/household_items").to route_to("household_items#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/household_items/1").to route_to("household_items#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/household_items/1").to route_to("household_items#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/household_items/1").to route_to("household_items#destroy", :id => "1")
    end

  end
end
