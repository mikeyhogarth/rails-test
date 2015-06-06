require "rails_helper"

RSpec.describe SalesController, :type => :routing do
  describe "routing" do

    it "routes to #show" do
      expect(:get => "/sales/1").to route_to("sales#show", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/sales").to route_to("sales#create")
    end

    it "routes to #destroy" do
      expect(:delete => "/sales/1").to route_to("sales#destroy", :id => "1")
    end

  end
end
