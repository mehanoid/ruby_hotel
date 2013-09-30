require 'spec_helper'

describe "RoomCategories" do
  describe "GET /admin/room_categories" do
    it "works! (now write some real specs)" do
      pending do
        # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
        get admin_room_categories_path
        response.status.should be(200)
      end
    end
  end
end
