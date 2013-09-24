require "spec_helper"

describe RoomCategoriesController do
  describe "routing" do

    it "routes to #index" do
      get("/room_categories").should route_to("room_categories#index")
    end

    it "routes to #new" do
      get("/room_categories/new").should route_to("room_categories#new")
    end

    it "routes to #show" do
      get("/room_categories/1").should route_to("room_categories#show", :id => "1")
    end

    it "routes to #edit" do
      get("/room_categories/1/edit").should route_to("room_categories#edit", :id => "1")
    end

    it "routes to #create" do
      post("/room_categories").should route_to("room_categories#create")
    end

    it "routes to #update" do
      put("/room_categories/1").should route_to("room_categories#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/room_categories/1").should route_to("room_categories#destroy", :id => "1")
    end

  end
end
