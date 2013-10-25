require "spec_helper"

describe ContactInformationsController do
  describe "routing" do

    it "routes to #index" do
      get("/contact_informations").should route_to("contact_informations#index")
    end

    it "routes to #new" do
      get("/contact_informations/new").should route_to("contact_informations#new")
    end

    it "routes to #show" do
      get("/contact_informations/1").should route_to("contact_informations#show", :id => "1")
    end

    it "routes to #edit" do
      get("/contact_informations/1/edit").should route_to("contact_informations#edit", :id => "1")
    end

    it "routes to #create" do
      post("/contact_informations").should route_to("contact_informations#create")
    end

    it "routes to #update" do
      put("/contact_informations/1").should route_to("contact_informations#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/contact_informations/1").should route_to("contact_informations#destroy", :id => "1")
    end

  end
end
