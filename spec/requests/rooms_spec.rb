require 'spec_helper'

describe "Rooms" do
  describe "GET /admin/rooms" do
    it "works! (now write some real specs)" do
      pending do
        # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
        get admin_rooms_path
        response.status.should be(200)
      end
    end
  end
end
