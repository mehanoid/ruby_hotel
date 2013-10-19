require "spec_helper"

describe Admin::AccommodationsController do
  describe "routing" do

    it "routes to #index" do
      get("/admin/accommodations").should route_to("admin/accommodations#index")
    end

    it "routes to #new" do
      get("/admin/accommodations/new").should route_to("admin/accommodations#new")
    end

    it "routes to #show" do
      get("/admin/accommodations/1").should route_to("admin/accommodations#show", :id => "1")
    end

    it "routes to #edit" do
      get("/admin/accommodations/1/edit").should route_to("admin/accommodations#edit", :id => "1")
    end

    it "routes to #create" do
      post("/admin/accommodations").should route_to("admin/accommodations#create")
    end

    it "routes to #update" do
      put("/admin/accommodations/1").should route_to("admin/accommodations#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/admin/accommodations/1").should route_to("admin/accommodations#destroy", :id => "1")
    end

  end
end
