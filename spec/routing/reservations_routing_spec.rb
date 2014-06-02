require "spec_helper"

describe ReservationsController do
  describe "routing" do

    it "routes to #new" do
      expect(get("/reservations/new")).to route_to("reservations#new")
    end

    it "routes to #show" do
      expect(get("/reservations/1")).to route_to("reservations#show", :id => "1")
    end

    it "routes to #create" do
      expect(post("/reservations")).to route_to("reservations#create")
    end
  end
end
