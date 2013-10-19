require "spec_helper"

describe Admin::PlacementsController do
  describe "routing" do

    it "routes to #index" do
      get("/admin/placements").should route_to("admin/placements#index")
    end

    it "routes to #new" do
      get("/admin/placements/new").should route_to("admin/placements#new")
    end

    it "routes to #show" do
      get("/admin/placements/1").should route_to("admin/placements#show", :id => "1")
    end

    it "routes to #edit" do
      get("/admin/placements/1/edit").should route_to("admin/placements#edit", :id => "1")
    end

    it "routes to #create" do
      post("/admin/placements").should route_to("admin/placements#create")
    end

    it "routes to #update" do
      put("/admin/placements/1").should route_to("admin/placements#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/admin/placements/1").should route_to("admin/placements#destroy", :id => "1")
    end

  end
end
