require 'spec_helper'

describe HomeController do

  describe "GET rooms" do
    it "assigns all room_categories as @room_categories" do
      room_category = create(:room_category)
      get :rooms
      assigns(:room_categories).should eq([room_category])
    end
  end

end
