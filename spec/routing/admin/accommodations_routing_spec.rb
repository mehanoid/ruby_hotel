require "spec_helper"

describe Admin::AccommodationsController do
  describe "routing" do

    it "routes to #index" do
      expect(get("/admin/accommodations")).to route_to("admin/accommodations#index")
    end

    it "routes to #new" do
      expect(get("/admin/accommodations/new")).to route_to("admin/accommodations#new")
    end

    it "routes to #show" do
      expect(get("/admin/accommodations/1")).to route_to("admin/accommodations#show", :id => "1")
    end

    it "routes to #edit" do
      expect(get("/admin/accommodations/1/edit")).to route_to("admin/accommodations#edit", :id => "1")
    end

    it "routes to #create" do
      expect(post("/admin/accommodations")).to route_to("admin/accommodations#create")
    end

    it "routes to #update" do
      expect(put("/admin/accommodations/1")).to route_to("admin/accommodations#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(delete("/admin/accommodations/1")).to route_to("admin/accommodations#destroy", :id => "1")
    end

  end
end
