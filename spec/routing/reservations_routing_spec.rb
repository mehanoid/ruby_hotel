require "spec_helper"

describe ReservationsController do
  describe "routing" do

    it "routes to #new" do
      get("/reservations/new").should route_to("reservations#new")
    end

    it "routes to #show" do
      get("/reservations/1").should route_to("reservations#show", :id => "1")
    end

    it "routes to #create" do
      post("/reservations").should route_to("reservations#create")
    end
  end
end
