require "spec_helper"

describe Admin::RoomCategoriesController do
  describe "routing" do

    it "routes to #index" do
      get("/admin/room_categories").should route_to("admin/room_categories#index")
    end

    it "routes to #new" do
      get("/admin/room_categories/new").should route_to("admin/room_categories#new")
    end

    it "routes to #show" do
      get("/admin/room_categories/1").should route_to("admin/room_categories#show", :id => "1")
    end

    it "routes to #edit" do
      get("/admin/room_categories/1/edit").should route_to("admin/room_categories#edit", :id => "1")
    end

    it "routes to #create" do
      post("/admin/room_categories").should route_to("admin/room_categories#create")
    end

    it "routes to #update" do
      put("/admin/room_categories/1").should route_to("admin/room_categories#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/admin/room_categories/1").should route_to("admin/room_categories#destroy", :id => "1")
    end

  end
end
